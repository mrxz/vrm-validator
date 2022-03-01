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
import 'package:gltf/src/ext/VRMC_springBone/vmrc_collider_group.dart';
import 'package:gltf/src/ext/VRMC_springBone/vrmc_collider.dart';
import 'package:gltf/src/ext/extensions.dart';

// https://github.com/vrm-c/vrm-specification/tree/master/specification/VRMC_springBone-1.0-beta
const String VRMC_SPRING_BONE = 'VRMC_springBone';
const String SPEC_VERSION = 'specVersion';
const String COLLIDERS = 'colliders';
const String COLLIDER_GROUPS = 'colliderGroups';
const String SPRINGS = 'springs';

const List<String> VRMC_SPRING_BONE_MEMBERS = <String>[
  SPEC_VERSION,
  COLLIDERS,
  COLLIDER_GROUPS,
  SPRINGS,
];

class VrmcSpringBone extends GltfProperty {
  final String specVersion;
  final List<Collider> colliders;
  final List<ColliderGroup> colliderGroups;

  VrmcSpringBone._(this.specVersion, this.colliders, this.colliderGroups,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static VrmcSpringBone fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, VRMC_SPRING_BONE_MEMBERS, context);
    }

    final specVersion = getString(map, SPEC_VERSION, context,
        req: true, regexp: RegExp(r'^1\.0-beta$'));

    return VrmcSpringBone._(
        specVersion,
        getObjectList(map, COLLIDERS, context, Collider.fromMap),
        getObjectList(map, COLLIDER_GROUPS, context, ColliderGroup.fromMap),
        getExtensions(map, VrmcSpringBone, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    if (colliderGroups != null) {
      context.path.add(COLLIDER_GROUPS);
      for (var i = 0; i < colliderGroups.length; i++) {
        final colliderGroup = colliderGroups[i];
        context.path.add(i.toString());
        colliderGroup.link(gltf, context);
        context.path.removeLast();
      }
      context.path.removeLast();
    }
  }
}

const Extension vrmcSpringBone =
    Extension(VRMC_SPRING_BONE, <Type, ExtensionDescriptor>{
  Gltf: ExtensionDescriptor(VrmcSpringBone.fromMap),
});
