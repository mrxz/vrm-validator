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

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/lookAt.md
const String OFFSET_FROM_HEAD_BONE = 'offsetFromHeadBone';
const String TYPE = 'type';
const String RANGE_MAP_HORIZONTAL_INNER = 'rangeMapHorizontalInner';
const String RANGE_MAP_HORIZONTAL_OUTER = 'rangeMapHorizontalOuter';
const String RANGE_MAP_VERTICAL_DOWN = 'rangeMapVerticalDown';
const String RANGE_MAP_VERTICAL_UP = 'rangeMapVerticalUp';

const List<String> VRMC_VRM_LOOK_AT_MEMBERS = <String>[
  OFFSET_FROM_HEAD_BONE,
  TYPE,
  RANGE_MAP_HORIZONTAL_INNER,
  RANGE_MAP_HORIZONTAL_OUTER,
  RANGE_MAP_VERTICAL_DOWN,
  RANGE_MAP_VERTICAL_UP,
];

class VrmcVrmLookAt extends GltfProperty {
  final List<double> offsetFromHeadBone;
  final String type;
  final RangeMap rangeMapHorizontalInner;
  final RangeMap rangeMapHorizontalOuter;
  final RangeMap rangeMapVerticalDown;
  final RangeMap rangeMapVerticalUp;

  VrmcVrmLookAt._(
      this.offsetFromHeadBone,
      this.type,
      this.rangeMapHorizontalInner,
      this.rangeMapHorizontalOuter,
      this.rangeMapVerticalDown,
      this.rangeMapVerticalUp,
      Map<String, Object> extensions,
      Object extras)
      : super(extensions, extras);

  static VrmcVrmLookAt fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, VRMC_VRM_LOOK_AT_MEMBERS, context);
    }

    return VrmcVrmLookAt._(
        getFloatList(map, OFFSET_FROM_HEAD_BONE, context,
            lengthsList: const [3]),
        getString(map, TYPE, context),
        getObjectFromInnerMap(
            map, RANGE_MAP_HORIZONTAL_INNER, context, RangeMap.fromMap),
        getObjectFromInnerMap(
            map, RANGE_MAP_HORIZONTAL_OUTER, context, RangeMap.fromMap),
        getObjectFromInnerMap(
            map, RANGE_MAP_VERTICAL_DOWN, context, RangeMap.fromMap),
        getObjectFromInnerMap(
            map, RANGE_MAP_VERTICAL_UP, context, RangeMap.fromMap),
        getExtensions(map, VrmcVrm, context),
        getExtras(map, context));
  }
}

// Range Map
// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/schema/VRMC_vrm.lookAt.rangeMap.schema.json

const String INPUT_MAX_VALUE = 'inputMaxValue';
const String OUTPUT_SCALE = 'outputScale';

const List<String> RANGE_MAP_MEMBERS = <String>[
  INPUT_MAX_VALUE,
  OUTPUT_SCALE,
];

class RangeMap extends GltfProperty {
  final double inputMaxValue;
  final double outputScale;

  RangeMap._(this.inputMaxValue, this.outputScale,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static RangeMap fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, RANGE_MAP_MEMBERS, context);
    }

    return RangeMap._(
        getFloat(map, INPUT_MAX_VALUE, context),
        getFloat(map, OUTPUT_SCALE, context),
        getExtensions(map, RangeMap, context),
        getExtras(map, context));
  }
}
