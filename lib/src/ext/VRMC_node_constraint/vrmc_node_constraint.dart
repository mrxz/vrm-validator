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
import 'package:gltf/src/ext/VRMC_node_constraint/vrmc_constraint.dart';
import 'package:gltf/src/ext/extensions.dart';

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_node_constraint-1.0/schema/VRMC_node_constraint.schema.json
const String VRMC_NODE_CONSTRAINT = 'VRMC_node_constraint';
const String SPEC_VERSION = 'specVersion';
const String CONSTRAINT = 'constraint';

const List<String> VRMC_NODE_CONSTRAINT_MEMBERS = <String>[
  SPEC_VERSION,
  CONSTRAINT,
];

class VrmcNodeConstraint extends GltfProperty {
  final String specVersion;
  final Constraint constraint;

  VrmcNodeConstraint._(this.specVersion, this.constraint,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static VrmcNodeConstraint fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, VRMC_NODE_CONSTRAINT_MEMBERS, context);
    }

    final specVersion = getString(map, SPEC_VERSION, context,
        req: true, regexp: RegExp(r'^1\.0$'));

    return VrmcNodeConstraint._(
        specVersion,
        getObjectFromInnerMap(map, CONSTRAINT, context, Constraint.fromMap,
            req: true),
        getExtensions(map, VrmcNodeConstraint, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    if (constraint != null) {
      context.path.add(CONSTRAINT);
      constraint.link(gltf, context);
      context.path.removeLast();
    }
  }
}

const Extension vrmcNodeConstraint =
    Extension(VRMC_NODE_CONSTRAINT, <Type, ExtensionDescriptor>{
  Node: ExtensionDescriptor(VrmcNodeConstraint.fromMap),
});
