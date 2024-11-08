/*
 * # Copyright (c) 2016-2019 The Khronos Group Inc.
 * # Copyright (c) 2022 Noeri Huisman
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

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:gltf/gltf.dart';
import 'package:gltf/src/errors.dart';
import 'package:gltf/src/utils.dart' show IsNonRelativeUri;
import 'package:test/test.dart';

Future compareReports(String basePath) async {
  final testCases =
      jsonDecode(await File('$basePath/assets.json').readAsString())
          as Map<String, Object>;

  group('Compare reports', () {
    for (final groupEntry in testCases.entries) {
      final groupMap = groupEntry.value as Map<String, Object>;
      group(groupMap['name'], () {
        final dir = groupEntry.key;
        for (final entry
            in (groupMap['tests'] as Map<String, Object>).entries) {
          test(entry.value, () async {
            final path = '$basePath/data/$dir/${entry.key}';

            final reader = GltfReader.filename(File(path).openRead(), path);
            final readerResult = await reader.read();

            final validationResult = ValidationResult(
                Uri.parse(path), reader.context, readerResult,
                writeTimestamp: false);

            if (readerResult?.gltf != null) {
              final resourcesLoader = _getFileResourceValidator(
                  reader.context, validationResult.uri, readerResult);
              await resourcesLoader.load();
            }

            final newReport = validationResult.toMap();

            final oldReport =
                jsonDecode(await File('$path.report.json').readAsString())
                    as Map;

            expect(newReport..remove('validatorVersion'),
                equals(oldReport..remove('validatorVersion')));
          });
        }
      });
    }
  });
}

ResourcesLoader _getFileResourceValidator(
        Context context, Uri assetUri, GltfReaderResult readerResult) =>
    ResourcesLoader(context, readerResult.gltf, externalBytesFetch: ([uri]) {
      if (uri == null) {
        // GLB-stored buffer
        return readerResult.buffer;
      }
      if (uri.isNonRelative) {
        return null;
      }

      return File.fromUri(assetUri.resolveUri(uri))
          .readAsBytes()
          .catchError((Object _) {
        throw GltfExternalResourceNotFoundException(uri.toString());
      });
    }, externalStreamFetch: (uri) {
      if (uri.isNonRelative) {
        return null;
      }
      // TODO: refactor resource loader to remove this
      final controller = StreamController<List<int>>();
      controller.onListen = () {
        File.fromUri(assetUri.resolveUri(uri)).openRead().listen(controller.add,
            onError: (Object e) {
          controller
              .addError(GltfExternalResourceNotFoundException(uri.toString()));
        }, onDone: controller.close);
      };
      return controller.stream;
    });

Future<GltfReaderResult> read(String path,
    {bool ignoreUnused = false, bool ignoreIncomplete = false}) async {
  final p = 'test/$path';
  final reader = GltfJsonReader(
      File(p).openRead(),
      Context(
          validate: true,
          options: ValidationOptions(ignoredIssues: <String>[
            if (ignoreUnused) LinkError.unusedObject.code,
            if (ignoreIncomplete) LinkError.incompleteExtensionSupport.code
          ])));
  final result = await reader.read();
  final validationResult = ValidationResult(
      Uri.parse(p), reader.context, result,
      writeTimestamp: false);

  if (result?.gltf != null) {
    final resourcesLoader =
        _getFileResourceValidator(reader.context, validationResult.uri, result);
    await resourcesLoader.load();
  }

  expect(reader.context.issues, isEmpty);

  return result;
}
