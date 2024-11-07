/*
 * # Copyright (c) 2024 Noeri Huisman
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

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_node_constraint-1.0/schema/VRMC_node_constraint.constraint.schema.json
const String ROLL = 'roll';
const String AIM = 'aim';
const String ROTATION = 'rotation';

const List<String> CONSTRAINT_MEMBERS = <String>[
  ROLL,
  AIM,
  ROTATION,
];

class Constraint extends GltfProperty {
  final RollConstraint roll;
  final AimConstraint aim;
  final RotationConstraint rotation;

  Constraint._(this.roll, this.aim, this.rotation,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static Constraint fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, CONSTRAINT_MEMBERS, context);
    }

    var total = (map.containsKey(ROLL) ? 1 : 0) +
        (map.containsKey(AIM) ? 1 : 0) +
        (map.containsKey(ROTATION) ? 1 : 0);
    if (context.validate && total != 1) {
      context.addIssue(SchemaError.oneOfMismatch, args: CONSTRAINT_MEMBERS);
    }

    return Constraint._(
        getObjectFromInnerMap(map, ROLL, context, RollConstraint.fromMap),
        getObjectFromInnerMap(map, AIM, context, AimConstraint.fromMap),
        getObjectFromInnerMap(
            map, ROTATION, context, RotationConstraint.fromMap),
        getExtensions(map, Constraint, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    if (roll != null) {
      context.path.add(ROLL);
      roll.link(gltf, context);
      context.path.removeLast();
    }

    if (aim != null) {
      context.path.add(AIM);
      aim.link(gltf, context);
      context.path.removeLast();
    }

    if (rotation != null) {
      context.path.add(ROTATION);
      rotation.link(gltf, context);
      context.path.removeLast();
    }
  }
}

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_node_constraint-1.0/schema/VRMC_node_constraint.rollConstraint.schema.json
const String SOURCE = 'source';
const String ROLL_AXIS = 'rollAxis';
const String WEIGHT = 'weight';
const List<String> ROLL_CONSTRAINT_MEMBERS = <String>[
  SOURCE,
  ROLL_AXIS,
  WEIGHT,
];

class RollConstraint extends GltfProperty {
  final int source;
  final String rollAxis;
  final double weight;

  RollConstraint._(this.source, this.rollAxis, this.weight,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static RollConstraint fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, ROLL_CONSTRAINT_MEMBERS, context);
    }

    return RollConstraint._(
        getIndex(map, SOURCE, context),
        getString(map, ROLL_AXIS, context, req: true, list: ['X', 'Y', 'Z']),
        getFloat(map, WEIGHT, context, min: 0.0, max: 1.0, def: 1.0),
        getExtensions(map, RollConstraint, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    var node = gltf.nodes[source];

    if (context.validate && source != -1) {
      if (node == null) {
        context.addIssue(LinkError.unresolvedReference,
            name: SOURCE, args: [source]);
      } else {
        node
          ..markAsUsed()
          ..isConstraintSource = true;
      }
    }
  }
}

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_node_constraint-1.0/schema/VRMC_node_constraint.aimConstraint.schema.json
const String AIM_AXIS = 'aimAxis';
const List<String> AIM_CONSTRAINT_MEMBERS = <String>[
  SOURCE,
  AIM_AXIS,
  WEIGHT,
];

class AimConstraint extends GltfProperty {
  final int source;
  final String aimAxis;
  final double weight;

  AimConstraint._(this.source, this.aimAxis, this.weight,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static AimConstraint fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, AIM_CONSTRAINT_MEMBERS, context);
    }

    return AimConstraint._(
        getIndex(map, SOURCE, context),
        getString(map, AIM_AXIS, context, req: true, list: [
          'PositiveX',
          'NegativeX',
          'PositiveY',
          'NegativeY',
          'PositiveZ',
          'NegativeZ'
        ]),
        getFloat(map, WEIGHT, context, min: 0.0, max: 1.0, def: 1.0),
        getExtensions(map, AimConstraint, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    var node = gltf.nodes[source];

    if (context.validate && source != -1) {
      if (node == null) {
        context.addIssue(LinkError.unresolvedReference,
            name: SOURCE, args: [source]);
      } else {
        node
          ..markAsUsed()
          ..isConstraintSource = true;
      }
    }
  }
}

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_node_constraint-1.0/schema/VRMC_node_constraint.rotationConstraint.schema.json
const List<String> ROTATION_CONSTRAINT_MEMBERS = <String>[
  SOURCE,
  WEIGHT,
];

class RotationConstraint extends GltfProperty {
  final int source;
  final double weight;

  RotationConstraint._(
      this.source, this.weight, Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static RotationConstraint fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, ROTATION_CONSTRAINT_MEMBERS, context);
    }

    return RotationConstraint._(
        getIndex(map, SOURCE, context),
        getFloat(map, WEIGHT, context, min: 0.0, max: 1.0, def: 1.0),
        getExtensions(map, RotationConstraint, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    var node = gltf.nodes[source];

    if (context.validate && source != -1) {
      if (node == null) {
        context.addIssue(LinkError.unresolvedReference,
            name: SOURCE, args: [source]);
      } else {
        node
          ..markAsUsed()
          ..isConstraintSource = true;
      }
    }
  }
}
