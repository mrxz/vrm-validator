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

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_springBone-1.0-beta/schema/VRMC_springBone.collider.schema.json
const String NODE = 'node';
const String SHAPE = 'shape';

const List<String> COLLIDER_MEMBERS = <String>[
  NODE,
  SHAPE,
];

class Collider extends GltfProperty {
  final int _nodeIndex;
  final ColliderShape shape;

  Node _node;

  Collider._(this._nodeIndex, this.shape, Map<String, Object> extensions,
      Object extras)
      : super(extensions, extras);

  static Collider fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, COLLIDER_MEMBERS, context);
    }

    return Collider._(
        getIndex(map, NODE, context),
        getObjectFromInnerMap(map, SHAPE, context, ColliderShape.fromMap),
        getExtensions(map, Collider, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    _node = gltf.nodes[_nodeIndex];

    if (context.validate && _nodeIndex != -1) {
      if (_node == null) {
        context.addIssue(LinkError.unresolvedReference,
            name: INDEX, args: [_nodeIndex]);
      } else {
        _node
          ..markAsUsed()
          ..isCollider = true;
      }
    }
  }
}

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_springBone-1.0-beta/schema/VRMC_springBone.shape.schema.json
const String SPHERE = 'sphere';
const String CAPSULE = 'capsule';
const List<String> COLLIDER_SHAPE_MEMBERS = <String>[
  SPHERE,
  CAPSULE,
];

const String OFFSET = 'offset';
const String RADIUS = 'radius';
const String TAIL = 'tail';
const List<String> SPHERE_MEMBERS = <String>[
  OFFSET,
  RADIUS,
];

const List<String> CAPSULE_MEMBERS = <String>[
  OFFSET,
  RADIUS,
  TAIL,
];

class Sphere {
  final List<double> offset;
  final double radius;

  Sphere._(this.offset, this.radius);

  static Sphere fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, SPHERE_MEMBERS, context);
    }

    return Sphere._(
        getFloatList(map, OFFSET, context, lengthsList: const [3], req: true),
        getFloat(map, RADIUS, context, req: true));
  }
}

class Capsule extends Sphere {
  final List<double> tail;

  Capsule._(List<double> offset, double radius, this.tail)
      : super._(offset, radius);

  static Capsule fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, CAPSULE_MEMBERS, context);
    }

    return Capsule._(
        getFloatList(map, OFFSET, context, lengthsList: const [3], req: true),
        getFloat(map, RADIUS, context, req: true),
        getFloatList(map, TAIL, context, lengthsList: const [3], req: true));
  }
}

class ColliderShape extends GltfProperty {
  final Sphere sphere;
  final Capsule capsule;

  ColliderShape._(
      this.sphere, this.capsule, Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static ColliderShape fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, COLLIDER_SHAPE_MEMBERS, context);
    }

    final hasSphere = map.containsKey(SPHERE);
    final hasCapsule = map.containsKey(CAPSULE);

    if (context.validate && (hasSphere && hasCapsule) ||
        (!hasSphere && !hasCapsule)) {
      context.addIssue(SchemaError.oneOfMismatch, args: CAMERA_TYPES);
    }

    return ColliderShape._(
        getObjectFromInnerMap(map, SPHERE, context, Sphere.fromMap),
        getObjectFromInnerMap(map, CAPSULE, context, Capsule.fromMap),
        getExtensions(map, ColliderShape, context),
        getExtras(map, context));
  }
}
