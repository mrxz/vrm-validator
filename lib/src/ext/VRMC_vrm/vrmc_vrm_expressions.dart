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

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/expressions.md
const String PRESET = 'preset';
const String CUSTOM = 'custom';

const List<String> VRMC_VRM_EXPRESSIONS_MEMBERS = <String>[
  PRESET,
  CUSTOM,
];

class VrmcVrmExpressions extends GltfProperty {
  final Map<String, Expression> preset;
  final Map<String, Expression> custom;

  VrmcVrmExpressions._(
      this.preset, this.custom, Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static VrmcVrmExpressions fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, VRMC_VRM_EXPRESSIONS_MEMBERS, context);
    }

    const expressionPresetNames = [
      'aa',
      'angry',
      'blink',
      'blinkLeft',
      'blinkRight',
      'ee',
      'happy',
      'ih',
      'lookDown',
      'lookLeft',
      'lookRight',
      'lookUp',
      'neutral',
      'oh',
      'ou',
      'relaxed',
      'sad',
      'surprised',
    ];
    final preset = getMapOfObjects(map, PRESET, context, Expression.fromMap,
        list: expressionPresetNames);
    final custom = getMapOfObjects(map, CUSTOM, context, Expression.fromMap);

    return VrmcVrmExpressions._(
        preset,
        custom,
        getExtensions(map, VrmcVrmExpressions, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    if (preset != null) {
      context.path.add(PRESET);
      for (final expression in preset.entries) {
        if (expression != null) {
          context.path.add(expression.key);
          expression.value.link(gltf, context);
          context.path.removeLast();
        }
      }
      context.path.removeLast();
    }

    if (custom != null) {
      context.path.add(PRESET);
      for (final expression in custom.entries) {
        if (expression != null) {
          context.path.add(expression.key);
          expression.value.link(gltf, context);
          context.path.removeLast();
        }
      }
      context.path.removeLast();
    }
  }
}

// Expression
// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/schema/VRMC_vrm.expressions.expression.schema.json

const String MORPH_TARGET_BINDS = 'morphTargetBinds';
const String MATERIAL_COLOR_BINDS = 'materialColorBinds';
const String TEXTURE_TRANSFORM_BINDS = 'textureTransformBinds';
const String IS_BINARY = 'isBinary';
const String OVERRIDE_BLINK = 'overrideBlink';
const String OVERRIDE_LOOK_AT = 'overrideLookAt';
const String OVERRIDE_MOUTH = 'overrideMouth';

const List<String> EXPRESSION_MEMBERS = <String>[
  MORPH_TARGET_BINDS,
  MATERIAL_COLOR_BINDS,
  TEXTURE_TRANSFORM_BINDS,
  IS_BINARY,
  OVERRIDE_BLINK,
  OVERRIDE_LOOK_AT,
  OVERRIDE_MOUTH,
];

class Expression extends GltfProperty {
  final List<MorphTargetBind> morphTargetBinds;
  final List<MaterialColorBind> materialColorBinds;
  final List<TextureTransformBind> textureTransformBinds;
  final bool isBinary;
  final String overrideBlink;
  final String overrideLookAt;
  final String overrideMouth;

  Expression._(
      this.morphTargetBinds,
      this.materialColorBinds,
      this.textureTransformBinds,
      this.isBinary,
      this.overrideBlink,
      this.overrideLookAt,
      this.overrideMouth,
      Map<String, Object> extensions,
      Object extras)
      : super(extensions, extras);

  static Expression fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, EXPRESSION_MEMBERS, context);
    }

    const overrideTypes = ['none', 'block', 'blend'];
    return Expression._(
        getObjectList(
            map, MORPH_TARGET_BINDS, context, MorphTargetBind.fromMap),
        getObjectList(
            map, MATERIAL_COLOR_BINDS, context, MaterialColorBind.fromMap),
        getObjectList(map, TEXTURE_TRANSFORM_BINDS, context,
            TextureTransformBind.fromMap),
        getBool(map, IS_BINARY, context),
        getString(map, OVERRIDE_BLINK, context,
            def: 'none', list: overrideTypes),
        getString(map, OVERRIDE_LOOK_AT, context,
            def: 'none', list: overrideTypes),
        getString(map, OVERRIDE_MOUTH, context,
            def: 'none', list: overrideTypes),
        getExtensions(map, Expression, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    if (morphTargetBinds != null) {
      context.path.add(MORPH_TARGET_BINDS);
      for (var i = 0; i < morphTargetBinds.length; i++) {
        final morphTargetBind = morphTargetBinds[i];
        context.path.add(i.toString());
        morphTargetBind.link(gltf, context);
        context.path.removeLast();
      }
      context.path.removeLast();
    }

    if (materialColorBinds != null) {
      context.path.add(MATERIAL_COLOR_BINDS);
      for (var i = 0; i < materialColorBinds.length; i++) {
        final materialColorBind = materialColorBinds[i];
        context.path.add(i.toString());
        materialColorBind.link(gltf, context);
        context.path.removeLast();
      }
      context.path.removeLast();
    }

    if (textureTransformBinds != null) {
      context.path.add(TEXTURE_TRANSFORM_BINDS);
      for (var i = 0; i < textureTransformBinds.length; i++) {
        final textureTransformBind = textureTransformBinds[i];
        context.path.add(i.toString());
        textureTransformBind.link(gltf, context);
        context.path.removeLast();
      }
      context.path.removeLast();
    }
  }
}

// Morph Target Bind
// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/schema/VRMC_vrm.expressions.expression.morphTargetBind.schema.json
const String NODE = 'node';
const String INDEX = 'index';
const String WEIGHT = 'weight';

const List<String> MORPH_TARGET_BIND_MEMBERS = <String>[
  NODE,
  INDEX,
  WEIGHT,
];

class MorphTargetBind extends GltfProperty {
  final int _nodeIndex;
  final int _morphTargetIndex;
  final double weight;

  Node _node;

  MorphTargetBind._(this._nodeIndex, this._morphTargetIndex, this.weight,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static MorphTargetBind fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, MORPH_TARGET_BIND_MEMBERS, context);
    }

    return MorphTargetBind._(
        getIndex(map, NODE, context, req: true),
        getIndex(map, INDEX, context, req: true),
        getFloat(map, WEIGHT, context, req: true),
        getExtensions(map, MorphTargetBind, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    _node = gltf.nodes[_nodeIndex];

    if (context.validate && _nodeIndex != -1) {
      if (_node == null) {
        context.addIssue(LinkError.unresolvedReference,
            name: NODE, args: [_nodeIndex]);
      } else {
        if (_node.mesh == null) {
          context.addIssue(LinkError.vrm1MorphTargetNodeWithoutMesh,
              name: NODE, args: [_nodeIndex]);
        } else if (_morphTargetIndex != -1) {
          // Check morph targets
          final hasReferencedMorphTarget = _node.mesh.primitives
              .map((e) => e.targets?.length)
              .every((e) => e != null && _morphTargetIndex < e);

          if (!hasReferencedMorphTarget) {
            context.addIssue(LinkError.unresolvedReference,
                name: INDEX, args: [_morphTargetIndex]);
          }
        }

        _node.markAsUsed();
      }
    }
  }
}

// Material Color Bind
// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/schema/VRMC_vrm.expressions.expression.materialColorBind.schema.json
const String MATERIAL = 'material';
const String TYPE = 'type';
const String TARGET_VALUE = 'targetValue';

const List<String> MATERIAL_COLOR_BIND_MEMBERS = <String>[
  MATERIAL,
  TYPE,
  TARGET_VALUE,
];

class MaterialColorBind extends GltfProperty {
  final int _materialIndex;
  final String type;
  final List<double> targetValue;

  Material _material;

  MaterialColorBind._(this._materialIndex, this.type, this.targetValue,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static MaterialColorBind fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, MATERIAL_COLOR_BIND_MEMBERS, context);
    }

    return MaterialColorBind._(
        getIndex(map, MATERIAL, context, req: true),
        getString(map, TYPE, context, req: true),
        getFloatList(map, TARGET_VALUE, context,
            lengthsList: const [4], req: true),
        getExtensions(map, MaterialColorBind, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    _material = gltf.materials[_materialIndex];

    if (context.validate && _materialIndex != -1) {
      if (_material == null) {
        context.addIssue(LinkError.unresolvedReference,
            name: INDEX, args: [_materialIndex]);
      } else {
        _material.markAsUsed();
      }
    }
  }
}

// Texture Transform Bind
// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/schema/VRMC_vrm.expressions.expression.textureTransformBind.schema.json
// Note: MATERIAL is already defined above
const String SCALE = 'scale';
const String OFFSET = 'offset';

const List<String> TEXTURE_TRANSFORM_BIND_MEMBERS = <String>[
  MATERIAL,
  SCALE,
  OFFSET,
];

class TextureTransformBind extends GltfProperty {
  final int _materialIndex;
  final List<double> scale;
  final List<double> offset;

  Material _material;

  TextureTransformBind._(this._materialIndex, this.scale, this.offset,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static TextureTransformBind fromMap(
      Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, MATERIAL_COLOR_BIND_MEMBERS, context);
    }

    return TextureTransformBind._(
        getIndex(map, MATERIAL, context, req: true),
        getFloatList(map, SCALE, context, lengthsList: const [2], def: [1, 1]),
        getFloatList(map, OFFSET, context, lengthsList: const [2], def: [0, 0]),
        getExtensions(map, TextureTransformBind, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    _material = gltf.materials[_materialIndex];

    if (context.validate && _materialIndex != -1) {
      if (_material == null) {
        context.addIssue(LinkError.unresolvedReference,
            name: INDEX, args: [_materialIndex]);
      } else {
        _material.markAsUsed();
      }
    }
  }
}
