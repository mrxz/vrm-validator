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

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/humanoid.md
const String HUMAN_BONES = 'humanBones';

const List<String> VRMC_VRM_HUMANOID_MEMBERS = <String>[
  HUMAN_BONES,
];

class VrmcVrmHumanoid extends GltfProperty {
  final HumanBones humanBones;

  VrmcVrmHumanoid._(
      this.humanBones, Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static VrmcVrmHumanoid fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, VRMC_VRM_HUMANOID_MEMBERS, context);
    }

    return VrmcVrmHumanoid._(
        getObjectFromInnerMap(map, HUMAN_BONES, context, HumanBones.fromMap,
            req: true),
        getExtensions(map, VrmcVrmHumanoid, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    if (humanBones != null) {
      context.path.add(HUMAN_BONES);
      humanBones.link(gltf, context);
      context.path.removeLast();
    }
  }
}

// Human Bones
// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/schema/VRMC_vrm.humanoid.humanBones.schema.json

const String CHEST = 'chest';
const String HEAD = 'head';
const String HIPS = 'hips';
const String JAW = 'jaw';
const String LEFT_EYE = 'leftEye';
const String LEFT_FOOT = 'leftFoot';
const String LEFT_HAND = 'leftHand';
const String LEFT_INDEX_DISTAL = 'leftIndexDistal';
const String LEFT_INDEX_INTERMEDIATE = 'leftIndexIntermediate';
const String LEFT_INDEX_PROXIMAL = 'leftIndexProximal';
const String LEFT_LITTLE_DISTAL = 'leftLittleDistal';
const String LEFT_LITTLE_INTERMEDIATE = 'leftLittleIntermediate';
const String LEFT_LITTLE_PROXIMAL = 'leftLittleProximal';
const String LEFT_LOWER_ARM = 'leftLowerArm';
const String LEFT_LOWER_LEG = 'leftLowerLeg';
const String LEFT_MIDDLE_DISTAL = 'leftMiddleDistal';
const String LEFT_MIDDLE_INTERMEDIATE = 'leftMiddleIntermediate';
const String LEFT_MIDDLE_PROXIMAL = 'leftMiddleProximal';
const String LEFT_RING_DISTAL = 'leftRingDistal';
const String LEFT_RING_INTERMEDIATE = 'leftRingIntermediate';
const String LEFT_RING_PROXIMAL = 'leftRingProximal';
const String LEFT_SHOULDER = 'leftShoulder';
const String LEFT_THUMB_DISTAL = 'leftThumbDistal';
const String LEFT_THUMB_PROXIMAL = 'leftThumbProximal';
const String LEFT_THUMB_METACARPAL = 'leftThumbMetacarpal';
const String LEFT_TOES = 'leftToes';
const String LEFT_UPPER_ARM = 'leftUpperArm';
const String LEFT_UPPER_LEG = 'leftUpperLeg';
const String NECK = 'neck';
const String RIGHT_EYE = 'rightEye';
const String RIGHT_FOOT = 'rightFoot';
const String RIGHT_HAND = 'rightHand';
const String RIGHT_INDEX_DISTAL = 'rightIndexDistal';
const String RIGHT_INDEX_INTERMEDIATE = 'rightIndexIntermediate';
const String RIGHT_INDEX_PROXIMAL = 'rightIndexProximal';
const String RIGHT_LITTLE_DISTAL = 'rightLittleDistal';
const String RIGHT_LITTLE_INTERMEDIATE = 'rightLittleIntermediate';
const String RIGHT_LITTLE_PROXIMAL = 'rightLittleProximal';
const String RIGHT_LOWER_ARM = 'rightLowerArm';
const String RIGHT_LOWER_LEG = 'rightLowerLeg';
const String RIGHT_MIDDLE_DISTAL = 'rightMiddleDistal';
const String RIGHT_MIDDLE_INTERMEDIATE = 'rightMiddleIntermediate';
const String RIGHT_MIDDLE_PROXIMAL = 'rightMiddleProximal';
const String RIGHT_RING_DISTAL = 'rightRingDistal';
const String RIGHT_RING_INTERMEDIATE = 'rightRingIntermediate';
const String RIGHT_RING_PROXIMAL = 'rightRingProximal';
const String RIGHT_SHOULDER = 'rightShoulder';
const String RIGHT_THUMB_DISTAL = 'rightThumbDistal';
const String RIGHT_THUMB_PROXIMAL = 'rightThumbProximal';
const String RIGHT_THUMB_METACARPAL = 'rightThumbMetacarpal';
const String RIGHT_TOES = 'rightToes';
const String RIGHT_UPPER_ARM = 'rightUpperArm';
const String RIGHT_UPPER_LEG = 'rightUpperLeg';
const String SPINE = 'spine';
const String UPPER_CHEST = 'upperChest';

const List<String> HUMAN_BONES_MEMBERS = <String>[
  CHEST,
  HEAD,
  HIPS,
  JAW,
  LEFT_EYE,
  LEFT_FOOT,
  LEFT_HAND,
  LEFT_INDEX_DISTAL,
  LEFT_INDEX_INTERMEDIATE,
  LEFT_INDEX_PROXIMAL,
  LEFT_LITTLE_DISTAL,
  LEFT_LITTLE_INTERMEDIATE,
  LEFT_LITTLE_PROXIMAL,
  LEFT_LOWER_ARM,
  LEFT_LOWER_LEG,
  LEFT_MIDDLE_DISTAL,
  LEFT_MIDDLE_INTERMEDIATE,
  LEFT_MIDDLE_PROXIMAL,
  LEFT_RING_DISTAL,
  LEFT_RING_INTERMEDIATE,
  LEFT_RING_PROXIMAL,
  LEFT_SHOULDER,
  LEFT_THUMB_DISTAL,
  LEFT_THUMB_METACARPAL,
  LEFT_THUMB_PROXIMAL,
  LEFT_TOES,
  LEFT_UPPER_ARM,
  LEFT_UPPER_LEG,
  NECK,
  RIGHT_EYE,
  RIGHT_FOOT,
  RIGHT_HAND,
  RIGHT_INDEX_DISTAL,
  RIGHT_INDEX_INTERMEDIATE,
  RIGHT_INDEX_PROXIMAL,
  RIGHT_LITTLE_DISTAL,
  RIGHT_LITTLE_INTERMEDIATE,
  RIGHT_LITTLE_PROXIMAL,
  RIGHT_LOWER_ARM,
  RIGHT_LOWER_LEG,
  RIGHT_MIDDLE_DISTAL,
  RIGHT_MIDDLE_INTERMEDIATE,
  RIGHT_MIDDLE_PROXIMAL,
  RIGHT_RING_DISTAL,
  RIGHT_RING_INTERMEDIATE,
  RIGHT_RING_PROXIMAL,
  RIGHT_SHOULDER,
  RIGHT_THUMB_DISTAL,
  RIGHT_THUMB_METACARPAL,
  RIGHT_THUMB_PROXIMAL,
  RIGHT_TOES,
  RIGHT_UPPER_ARM,
  RIGHT_UPPER_LEG,
  SPINE,
  UPPER_CHEST,
];

class HumanBones {
  final HumanBone chest;
  final HumanBone head;
  final HumanBone hips;
  final HumanBone jaw;
  final HumanBone leftEye;
  final HumanBone leftFoot;
  final HumanBone leftHand;
  final HumanBone leftIndexDistal;
  final HumanBone leftIndexIntermediate;
  final HumanBone leftIndexProximal;
  final HumanBone leftLittleDistal;
  final HumanBone leftLittleIntermediate;
  final HumanBone leftLittleProximal;
  final HumanBone leftLowerArm;
  final HumanBone leftLowerLeg;
  final HumanBone leftMiddleDistal;
  final HumanBone leftMiddleIntermediate;
  final HumanBone leftMiddleProximal;
  final HumanBone leftRingDistal;
  final HumanBone leftRingIntermediate;
  final HumanBone leftRingProximal;
  final HumanBone leftShoulder;
  final HumanBone leftThumbDistal;
  final HumanBone leftThumbProximal;
  final HumanBone leftThumbMetacarpal;
  final HumanBone leftToes;
  final HumanBone leftUpperArm;
  final HumanBone leftUpperLeg;
  final HumanBone neck;
  final HumanBone rightEye;
  final HumanBone rightFoot;
  final HumanBone rightHand;
  final HumanBone rightIndexDistal;
  final HumanBone rightIndexIntermediate;
  final HumanBone rightIndexProximal;
  final HumanBone rightLittleDistal;
  final HumanBone rightLittleIntermediate;
  final HumanBone rightLittleProximal;
  final HumanBone rightLowerArm;
  final HumanBone rightLowerLeg;
  final HumanBone rightMiddleDistal;
  final HumanBone rightMiddleIntermediate;
  final HumanBone rightMiddleProximal;
  final HumanBone rightRingDistal;
  final HumanBone rightRingIntermediate;
  final HumanBone rightRingProximal;
  final HumanBone rightShoulder;
  final HumanBone rightThumbDistal;
  final HumanBone rightThumbProximal;
  final HumanBone rightThumbMetacarpal;
  final HumanBone rightToes;
  final HumanBone rightUpperArm;
  final HumanBone rightUpperLeg;
  final HumanBone spine;
  final HumanBone upperChest;

  HumanBones._(
      this.chest,
      this.head,
      this.hips,
      this.jaw,
      this.leftEye,
      this.leftFoot,
      this.leftHand,
      this.leftIndexDistal,
      this.leftIndexIntermediate,
      this.leftIndexProximal,
      this.leftLittleDistal,
      this.leftLittleIntermediate,
      this.leftLittleProximal,
      this.leftLowerArm,
      this.leftLowerLeg,
      this.leftMiddleDistal,
      this.leftMiddleIntermediate,
      this.leftMiddleProximal,
      this.leftRingDistal,
      this.leftRingIntermediate,
      this.leftRingProximal,
      this.leftShoulder,
      this.leftThumbDistal,
      this.leftThumbProximal,
      this.leftThumbMetacarpal,
      this.leftToes,
      this.leftUpperArm,
      this.leftUpperLeg,
      this.neck,
      this.rightEye,
      this.rightFoot,
      this.rightHand,
      this.rightIndexDistal,
      this.rightIndexIntermediate,
      this.rightIndexProximal,
      this.rightLittleDistal,
      this.rightLittleIntermediate,
      this.rightLittleProximal,
      this.rightLowerArm,
      this.rightLowerLeg,
      this.rightMiddleDistal,
      this.rightMiddleIntermediate,
      this.rightMiddleProximal,
      this.rightRingDistal,
      this.rightRingIntermediate,
      this.rightRingProximal,
      this.rightShoulder,
      this.rightThumbDistal,
      this.rightThumbProximal,
      this.rightThumbMetacarpal,
      this.rightToes,
      this.rightUpperArm,
      this.rightUpperLeg,
      this.spine,
      this.upperChest);

  static HumanBones fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, HUMAN_BONES_MEMBERS, context);
    }

    return HumanBones._(
        getObjectFromInnerMap(map, CHEST, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, HEAD, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, HIPS, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, JAW, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_EYE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_FOOT, context, HumanBone.fromMap,
            req: true),
        getObjectFromInnerMap(map, LEFT_HAND, context, HumanBone.fromMap,
            req: true),
        getObjectFromInnerMap(
            map, LEFT_INDEX_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_INDEX_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_INDEX_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_LITTLE_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_LITTLE_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_LITTLE_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_LOWER_ARM, context, HumanBone.fromMap,
            req: true),
        getObjectFromInnerMap(map, LEFT_LOWER_LEG, context, HumanBone.fromMap,
            req: true),
        getObjectFromInnerMap(
            map, LEFT_MIDDLE_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_MIDDLE_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_MIDDLE_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_RING_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_RING_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_RING_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_SHOULDER, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_THUMB_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_THUMB_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(
            map, LEFT_THUMB_METACARPAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_TOES, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_UPPER_ARM, context, HumanBone.fromMap,
            req: true),
        getObjectFromInnerMap(map, LEFT_UPPER_LEG, context, HumanBone.fromMap,
            req: true),
        getObjectFromInnerMap(map, NECK, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_EYE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_FOOT, context, HumanBone.fromMap,
            req: true),
        getObjectFromInnerMap(map, RIGHT_HAND, context, HumanBone.fromMap,
            req: true),
        getObjectFromInnerMap(map, RIGHT_INDEX_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_INDEX_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_INDEX_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_LITTLE_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_LITTLE_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_LITTLE_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_LOWER_ARM, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, RIGHT_LOWER_LEG, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, RIGHT_MIDDLE_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_MIDDLE_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_MIDDLE_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_RING_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_RING_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_RING_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_SHOULDER, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_THUMB_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_THUMB_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_THUMB_METACARPAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_TOES, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_UPPER_ARM, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, RIGHT_UPPER_LEG, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, SPINE, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, UPPER_CHEST, context, HumanBone.fromMap));
  }

  void link(Gltf gltf, Context context) {
    final bones = <int, String>{};
    void linkBone(String name, HumanBone bone) {
      if (bone != null) {
        context.path.add(name);
        bone.link(gltf, context);
        if (bones.containsKey(bone._nodeIndex)) {
          context.addIssue(SemanticError.vrm1BoneNotUnique,
              args: [name, bones[bone._nodeIndex], bone._nodeIndex]);
        } else {
          bones[bone._nodeIndex] = name;
        }
        context.path.removeLast();
      }
    }

    linkBone(CHEST, chest);
    linkBone(HEAD, head);
    linkBone(HIPS, hips);
    linkBone(JAW, jaw);
    linkBone(LEFT_EYE, leftEye);
    linkBone(LEFT_FOOT, leftFoot);
    linkBone(LEFT_HAND, leftHand);
    linkBone(LEFT_INDEX_DISTAL, leftIndexDistal);
    linkBone(LEFT_INDEX_INTERMEDIATE, leftIndexIntermediate);
    linkBone(LEFT_INDEX_PROXIMAL, leftIndexProximal);
    linkBone(LEFT_LITTLE_DISTAL, leftLittleDistal);
    linkBone(LEFT_LITTLE_INTERMEDIATE, leftLittleIntermediate);
    linkBone(LEFT_LITTLE_PROXIMAL, leftLittleProximal);
    linkBone(LEFT_LOWER_ARM, leftLowerArm);
    linkBone(LEFT_LOWER_LEG, leftLowerLeg);
    linkBone(LEFT_MIDDLE_DISTAL, leftMiddleDistal);
    linkBone(LEFT_MIDDLE_INTERMEDIATE, leftMiddleIntermediate);
    linkBone(LEFT_MIDDLE_PROXIMAL, leftMiddleProximal);
    linkBone(LEFT_RING_DISTAL, leftRingDistal);
    linkBone(LEFT_RING_INTERMEDIATE, leftRingIntermediate);
    linkBone(LEFT_RING_PROXIMAL, leftRingProximal);
    linkBone(LEFT_SHOULDER, leftShoulder);
    linkBone(LEFT_THUMB_DISTAL, leftThumbDistal);
    linkBone(LEFT_THUMB_PROXIMAL, leftThumbProximal);
    linkBone(LEFT_THUMB_METACARPAL, leftThumbMetacarpal);
    linkBone(LEFT_TOES, leftToes);
    linkBone(LEFT_UPPER_ARM, leftUpperArm);
    linkBone(LEFT_UPPER_LEG, leftUpperLeg);
    linkBone(NECK, neck);
    linkBone(RIGHT_EYE, rightEye);
    linkBone(RIGHT_FOOT, rightFoot);
    linkBone(RIGHT_HAND, rightHand);
    linkBone(RIGHT_INDEX_DISTAL, rightIndexDistal);
    linkBone(RIGHT_INDEX_INTERMEDIATE, rightIndexIntermediate);
    linkBone(RIGHT_INDEX_PROXIMAL, rightIndexProximal);
    linkBone(RIGHT_LITTLE_DISTAL, rightLittleDistal);
    linkBone(RIGHT_LITTLE_INTERMEDIATE, rightLittleIntermediate);
    linkBone(RIGHT_LITTLE_PROXIMAL, rightLittleProximal);
    linkBone(RIGHT_LOWER_ARM, rightLowerArm);
    linkBone(RIGHT_LOWER_LEG, rightLowerLeg);
    linkBone(RIGHT_MIDDLE_DISTAL, rightMiddleDistal);
    linkBone(RIGHT_MIDDLE_INTERMEDIATE, rightMiddleIntermediate);
    linkBone(RIGHT_MIDDLE_PROXIMAL, rightMiddleProximal);
    linkBone(RIGHT_RING_DISTAL, rightRingDistal);
    linkBone(RIGHT_RING_INTERMEDIATE, rightRingIntermediate);
    linkBone(RIGHT_RING_PROXIMAL, rightRingProximal);
    linkBone(RIGHT_SHOULDER, rightShoulder);
    linkBone(RIGHT_THUMB_DISTAL, rightThumbDistal);
    linkBone(RIGHT_THUMB_PROXIMAL, rightThumbProximal);
    linkBone(RIGHT_THUMB_METACARPAL, rightThumbMetacarpal);
    linkBone(RIGHT_TOES, rightToes);
    linkBone(RIGHT_UPPER_ARM, rightUpperArm);
    linkBone(RIGHT_UPPER_LEG, rightUpperLeg);
    linkBone(SPINE, spine);
    linkBone(UPPER_CHEST, upperChest);
  }
}

// Human Bone
// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0-beta/schema/VRMC_vrm.humanoid.humanBones.humanBone.schema.json

const String NODE = 'node';

const List<String> HUMAN_BONE_MEMBERS = <String>[
  NODE,
];

class HumanBone extends GltfProperty {
  final int _nodeIndex;

  Node _node;

  HumanBone._(this._nodeIndex, Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static HumanBone fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, HUMAN_BONE_MEMBERS, context);
    }

    return HumanBone._(getIndex(map, NODE, context, req: true),
        getExtensions(map, HumanBone, context), getExtras(map, context));
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
