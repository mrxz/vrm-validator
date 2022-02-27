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

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/firstPerson.md
const String MESH_ANNOTATIONS = 'meshAnnotations';

const List<String> VRMC_VRM_FIRST_PERSON_MEMBERS = <String>[
  MESH_ANNOTATIONS
];

class VrmcVrmFirstPerson extends GltfProperty {
  final List<MeshAnnotation> meshAnnotations;

  VrmcVrmFirstPerson._(
      this.meshAnnotations,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static VrmcVrmFirstPerson fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, VRMC_VRM_FIRST_PERSON_MEMBERS, context);
    }

    return VrmcVrmFirstPerson._(
        getObjectList(map, MESH_ANNOTATIONS, context, MeshAnnotation.fromMap),
        getExtensions(map, VrmcVrm, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    if (meshAnnotations != null) {
      context.path.add(MESH_ANNOTATIONS);
      for (var i = 0; i < meshAnnotations.length; i++) {
        final meshAnnotation = meshAnnotations[i];
        context.path.add(i.toString());
        meshAnnotation.link(gltf, context);
        context.path.removeLast();
      }
      context.path.removeLast();
    }
  }
}


// Mesh Annotation
// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/schema/VRMC_vrm.firstPerson.meshAnnotation.schema.json
const String NODE = 'node';
const String TYPE = 'type';

const List<String> MESH_ANNOTATION_MEMBERS = <String>[
  NODE,
  TYPE,
];

class MeshAnnotation extends GltfProperty {
  final int _nodeIndex;
  final String type;

  Node _node;

  MeshAnnotation._(
      this._nodeIndex,
      this.type,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static MeshAnnotation fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, MESH_ANNOTATION_MEMBERS, context);
    }

    return MeshAnnotation._(
        getIndex(map, NODE, context, req: true),
        getString(map, TYPE, context, req: true),
        getExtensions(map, MeshAnnotation, context),
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
        _node.markAsUsed();
      }
    }
  }
}
