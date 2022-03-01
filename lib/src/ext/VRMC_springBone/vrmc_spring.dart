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
import 'package:gltf/src/ext/extensions.dart';

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_springBone-1.0-beta/schema/VRMC_springBone.spring.schema.json
const String NAME = 'name';
const String JOINTS = 'joints';
const String COLLIDER_GROUPS = 'colliderGroups';

const List<String> SPRING_MEMBERS = <String>[
  NAME,
  JOINTS,
  COLLIDER_GROUPS,
];

class Spring extends GltfProperty {
  final String name;
  final List<Joint> joints;
  final List<int> _colliderGroupIndices;

  Spring._(this.name, this.joints, this._colliderGroupIndices,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static Spring fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, SPRING_MEMBERS, context);
    }

    return Spring._(
        getString(map, NAME, context),
        getObjectList(map, JOINTS, context, Joint.fromMap, req: true),
        getIndicesList(map, COLLIDER_GROUPS, context),
        getExtensions(map, Spring, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {}
}

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_springBone-1.0-beta/schema/VRMC_springBone.joint.schema.json
const String NODE = 'node';
const String HIT_RADIUS = 'hitRadius';
const String STIFFNESS = 'stiffness';
const String GRAVITY_POWER = 'gravityPower';
const String GRAVITY_DIR = 'gravityDir';
const String DRAG_FORCE = 'dragForce';

const List<String> JOINT_MEMBERS = <String>[
  NODE,
  HIT_RADIUS,
  STIFFNESS,
  GRAVITY_POWER,
  GRAVITY_DIR,
  DRAG_FORCE,
];

class Joint extends GltfProperty {
  final int _nodeIndex;
  final double hitRadius;
  final double stiffness;
  final double gravityPower;
  final List<double> gravityDir;
  final double dragForce;

  Node node;

  Joint._(
      this._nodeIndex,
      this.hitRadius,
      this.stiffness,
      this.gravityPower,
      this.gravityDir,
      this.dragForce,
      Map<String, Object> extensions,
      Object extras)
      : super(extensions, extras);

  static Joint fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, JOINT_MEMBERS, context);
    }

    return Joint._(
        getIndex(map, NODE, context, req: true),
        getFloat(map, HIT_RADIUS, context, min: 0, def: 0),
        getFloat(map, STIFFNESS, context, min: 0, def: 1),
        getFloat(map, GRAVITY_POWER, context, min: 0, def: 0),
        getFloatList(map, GRAVITY_DIR, context,
            lengthsList: const [3], def: [0.0, -1.0, 0.0]),
        getFloat(map, DRAG_FORCE, context, min: 0, def: 0.5, max: 1),
        getExtensions(map, Joint, context),
        getExtras(map, context));
  }
}
