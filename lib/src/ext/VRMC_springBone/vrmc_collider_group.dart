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
import 'package:gltf/src/ext/VRMC_springBone/vrmc_collider.dart';
import 'package:gltf/src/ext/extensions.dart';

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_springBone-1.0/schema/VRMC_springBone.colliderGroup.schema.json
const String NAME = 'name';
const String COLLIDERS = 'colliders';

const List<String> COLLIDER_GROUP_MEMBERS = <String>[
  NAME,
  COLLIDERS,
];

class ColliderGroup extends GltfProperty {
  final String name;
  final List<int> _colliderIndices;

  List<Collider> _colliders;

  ColliderGroup._(this.name, this._colliderIndices,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static ColliderGroup fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, COLLIDER_GROUP_MEMBERS, context);
    }

    return ColliderGroup._(
        getString(map, NAME, context),
        getIndicesList(map, COLLIDERS, context, req: true),
        getExtensions(map, ColliderGroup, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    final springBoneExtension = gltf.extensions[VRMC_SPRING_BONE];
    if (_colliderIndices != null) {
      _colliders = List<Collider>.filled(_colliderIndices.length, null);

      resolveUsableList(_colliderIndices, _colliders,
          (springBoneExtension as VrmcSpringBone).colliders, name, context);
    }
  }
}
