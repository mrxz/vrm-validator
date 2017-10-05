/*
 * # Copyright (c) 2016-2017 The Khronos Group Inc.
 * # Copyright (c) 2016 Alexey Knyazev
 * #
 * # Licensed under the Apache License, Version 2.0 (the "License");
 * # you may not use this file except in compliance with the License.
 * # You may obtain a copy of the License at
 * #
 * #     http://www.apache.org/licenses/LICENSE-2.0
 * #
 * # Unless required by applicable law or agreed to in writing, software
 * # distributed under the License is distributed on an "AS IS" BASIS,
 * # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * # See the License for the specific language governing permissions and
 * # limitations under the License.
 */

// Copyright 2016 Google Inc. Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';

import 'package:gltf/src/errors.dart';
import 'package:grinder/grinder.dart';
import 'package:node_preamble/preamble.dart' as preamble;
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

final String _version =
    loadYaml(new File('pubspec.yaml').readAsStringSync())['version'];

Future main(List<String> args) => grind(args);

@Task('Generate ISSUES.md')
void issues() {
  final sb = new StringBuffer('# glTF 2.0 Validation Issues\n');

  String severityToMdString(Severity severity) {
    switch (severity) {
      case Severity.Error:
        return 'Error';
      case Severity.Warning:
        return 'Warning';
      default:
        return null;
    }
  }

  var total = 0;
  void processErrorClass(Type type) {
    final errorClassMirror = reflectClass(type);
    sb
      ..writeln('## ${errorClassMirror.reflectedType}')
      ..writeln('| No | Name | Message | Severity |')
      ..writeln('|:---:|-----|---------|----------|');

    var i = 0;
    final args = ['%1', '%2', '%3', '%4'];
    for (final symbol in errorClassMirror.staticMembers.keys) {
      final Object issueType = errorClassMirror.getField(symbol).reflectee;
      if (issueType is IssueType) {
        sb.writeln('|${++i}|${issueType.code}|${issueType.message(args)}|'
            '${severityToMdString(issueType.severity)}');
      }
    }
    total += i;
  }

  processErrorClass(IoError);
  processErrorClass(SchemaError);
  processErrorClass(SemanticError);
  processErrorClass(LinkError);
  processErrorClass(DataError);
  processErrorClass(GlbError);

  new File('ISSUES.md').writeAsStringSync(sb.toString(), flush: true);
  log('Total number of issues: $total');
}

@Task('Build Dart snapshot.')
void snapshot() {
  _ensureBuild();
  Dart.run('bin/gltf_validator.dart',
      vmArgs: ['--snapshot=build/gltf_validator.snapshot']);
}

@Depends(issues)
@Task('Build an npm package.')
void npm() {
  _ensureBuild();
  final destDir = 'build/npm/';
  final sourceDir = 'tool/npm_template';

  final dir = new Directory(destDir);
  if (dir.existsSync()) {
    dir.deleteSync(recursive: true);
  }
  dir.createSync(recursive: true);

  final destination = new File(p.join(destDir, 'gltf_validator.dart.js'));
  final args = [
    '--no-source-maps',
    '--trust-type-annotations',
    '--trust-primitives',
    '--minify'
  ];

  Dart2js.compile(new File(p.join(sourceDir, 'node_wrapper.dart')),
      outFile: destination, extraArgs: args);
  final text = destination.readAsStringSync();
  destination.writeAsStringSync('${preamble.getPreamble(minified: true)}$text');
  delete(new File(p.join(destDir, 'gltf_validator.dart.js.deps')));

  final Map<String, dynamic> json = JSON
      .decode(new File(p.join(sourceDir, 'package.json')).readAsStringSync());
  json['version'] = _version;

  log("copying package.json to $destDir");
  new File(p.join(destDir, 'package.json'))
      .writeAsStringSync((const JsonEncoder.withIndent('    ')).convert(json));

  copy(new File(p.join(sourceDir, 'index.js')), dir);
  copy(new File(p.join(sourceDir, 'README.md')), dir);
  copy(new File('ISSUES.md'), dir);
  copy(new File('LICENSE'), dir);
  copy(new File('3RD_PARTY'), dir);
}

/// Ensure that the `build/` directory exists.
void _ensureBuild() {
  new Directory('build').createSync(recursive: true);
}