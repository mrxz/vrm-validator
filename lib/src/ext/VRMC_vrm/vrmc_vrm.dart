/*
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

library gltf.extensions.vrmc_vrm;

import 'package:gltf/src/base/gltf_property.dart';
import 'package:gltf/src/ext/VRMC_vrm/vrmc_vrm_first_person.dart';
import 'package:gltf/src/ext/VRMC_vrm/vrmc_vrm_humanoid.dart';
import 'package:gltf/src/ext/VRMC_vrm/vrmc_vrm_meta.dart';
import 'package:gltf/src/ext/extensions.dart';

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/README.md
const String VRMC_VRM = 'VRMC_vrm';
const String SPEC_VERSION = 'specVersion';
const String META = 'meta';
const String HUMANOID = 'humanoid';
const String FIRST_PERSON = 'firstPerson';
const String LOOK_AT = 'lookAt';
const String EXPRESSIONS = 'expressions';

const List<String> VRMC_VRM_MEMBERS = <String>[
  SPEC_VERSION,
  META,
  HUMANOID,
  FIRST_PERSON,
  LOOK_AT,
  EXPRESSIONS
];

class VrmcVrm extends GltfProperty {
  final String specVersion;
  final VrmcVrmMeta meta;
  final VrmcVrmHumanoid humanoid;
  final VrmcVrmFirstPerson firstPerson;

  VrmcVrm._(this.specVersion,
      this.meta,
      this.humanoid,
      this.firstPerson,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static VrmcVrm fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, VRMC_VRM_MEMBERS, context);
    }

    final specVersion = getString(map, SPEC_VERSION, context, req: true, regexp: RegExp(r'^1\.0-beta$'));

    final meta = getObjectFromInnerMap(map, META, context, VrmcVrmMeta.fromMap, req: true);

    final humanoid = getObjectFromInnerMap(map, HUMANOID, context, VrmcVrmHumanoid.fromMap, req: true);

    final firstPerson = getObjectFromInnerMap(map, FIRST_PERSON, context, VrmcVrmFirstPerson.fromMap);

    return VrmcVrm._(
        specVersion,
        meta,
        humanoid,
        firstPerson,
        getExtensions(map, VrmcVrm, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    if (meta != null) {
      context.path.add(META);
      meta.link(gltf, context);
      context.path.removeLast();
    }

    if (humanoid != null) {
      context.path.add(HUMANOID);
      humanoid.link(gltf, context);
      context.path.removeLast();
    }

    if (firstPerson != null) {
      context.path.add(FIRST_PERSON);
      firstPerson.link(gltf, context);
      context.path.removeLast();
    }
  }
}

const Extension vrmcVrm =
    Extension(VRMC_VRM, <Type, ExtensionDescriptor>{
  Gltf: ExtensionDescriptor(VrmcVrm.fromMap),
});
