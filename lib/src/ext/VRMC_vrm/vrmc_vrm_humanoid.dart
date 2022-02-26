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
      this.humanBones,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static VrmcVrmHumanoid fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, VRMC_VRM_HUMANOID_MEMBERS, context);
    }

    return VrmcVrmHumanoid._(
        getObjectFromInnerMap(map, HUMAN_BONES, context, HumanBones.fromMap, req: true),
        getExtensions(map, VrmcVrm, context),
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
const String LEFT_THUMB_INTERMEDIATE = 'leftThumbIntermediate';
const String LEFT_THUMB_PROXIMAL = 'leftThumbProximal';
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
const String RIGHT_THUMB_INTERMEDIATE = 'rightThumbIntermediate';
const String RIGHT_THUMB_PROXIMAL = 'rightThumbProximal';
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
  LEFT_THUMB_INTERMEDIATE,
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
  RIGHT_THUMB_INTERMEDIATE,
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
  final HumanBone leftThumbIntermediate;
  final HumanBone leftThumbProximal;
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
  final HumanBone rightThumbIntermediate;
  final HumanBone rightThumbProximal;
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
    this.leftThumbIntermediate,
    this.leftThumbProximal,
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
    this.rightThumbIntermediate,
    this.rightThumbProximal,
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
        getObjectFromInnerMap(map, LEFT_FOOT, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, LEFT_HAND, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, LEFT_INDEX_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_INDEX_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_INDEX_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_LITTLE_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_LITTLE_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_LITTLE_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_LOWER_ARM, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, LEFT_LOWER_LEG, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, LEFT_MIDDLE_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_MIDDLE_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_MIDDLE_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_RING_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_RING_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_RING_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_SHOULDER, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_THUMB_DISTAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_THUMB_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_THUMB_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_TOES, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, LEFT_UPPER_ARM, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, LEFT_UPPER_LEG, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, NECK, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_EYE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_FOOT, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, RIGHT_HAND, context, HumanBone.fromMap, req: true),
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
        getObjectFromInnerMap(map, RIGHT_THUMB_INTERMEDIATE, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_THUMB_PROXIMAL, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_TOES, context, HumanBone.fromMap),
        getObjectFromInnerMap(map, RIGHT_UPPER_ARM, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, RIGHT_UPPER_LEG, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, SPINE, context, HumanBone.fromMap, req: true),
        getObjectFromInnerMap(map, UPPER_CHEST, context, HumanBone.fromMap));
  }

  void link(Gltf gltf, Context context) {
    if (chest != null) {
      context.path.add(CHEST);
      chest.link(gltf, context);
      context.path.removeLast();
    }
    if (head != null) {
      context.path.add(HEAD);
      head.link(gltf, context);
      context.path.removeLast();
    }
    if (hips != null) {
      context.path.add(HIPS);
      hips.link(gltf, context);
      context.path.removeLast();
    }
    if (jaw != null) {
      context.path.add(JAW);
      jaw.link(gltf, context);
      context.path.removeLast();
    }
    if (leftEye != null) {
      context.path.add(LEFT_EYE);
      leftEye.link(gltf, context);
      context.path.removeLast();
    }
    if (leftFoot != null) {
      context.path.add(LEFT_FOOT);
      leftFoot.link(gltf, context);
      context.path.removeLast();
    }
    if (leftHand != null) {
      context.path.add(LEFT_HAND);
      leftHand.link(gltf, context);
      context.path.removeLast();
    }
    if (leftIndexDistal != null) {
      context.path.add(LEFT_INDEX_DISTAL);
      leftIndexDistal.link(gltf, context);
      context.path.removeLast();
    }
    if (leftIndexIntermediate != null) {
      context.path.add(LEFT_INDEX_INTERMEDIATE);
      leftIndexIntermediate.link(gltf, context);
      context.path.removeLast();
    }
    if (leftIndexProximal != null) {
      context.path.add(LEFT_INDEX_PROXIMAL);
      leftIndexProximal.link(gltf, context);
      context.path.removeLast();
    }
    if (leftLittleDistal != null) {
      context.path.add(LEFT_LITTLE_DISTAL);
      leftLittleDistal.link(gltf, context);
      context.path.removeLast();
    }
    if (leftLittleIntermediate != null) {
      context.path.add(LEFT_LITTLE_INTERMEDIATE);
      leftLittleIntermediate.link(gltf, context);
      context.path.removeLast();
    }
    if (leftLittleProximal != null) {
      context.path.add(LEFT_LITTLE_PROXIMAL);
      leftLittleProximal.link(gltf, context);
      context.path.removeLast();
    }
    if (leftLowerArm != null) {
      context.path.add(LEFT_LOWER_ARM);
      leftLowerArm.link(gltf, context);
      context.path.removeLast();
    }
    if (leftLowerLeg != null) {
      context.path.add(LEFT_LOWER_LEG);
      leftLowerLeg.link(gltf, context);
      context.path.removeLast();
    }
    if (leftMiddleDistal != null) {
      context.path.add(LEFT_MIDDLE_DISTAL);
      leftMiddleDistal.link(gltf, context);
      context.path.removeLast();
    }
    if (leftMiddleIntermediate != null) {
      context.path.add(LEFT_MIDDLE_INTERMEDIATE);
      leftMiddleIntermediate.link(gltf, context);
      context.path.removeLast();
    }
    if (leftMiddleProximal != null) {
      context.path.add(LEFT_MIDDLE_PROXIMAL);
      leftMiddleProximal.link(gltf, context);
      context.path.removeLast();
    }
    if (leftRingDistal != null) {
      context.path.add(LEFT_RING_DISTAL);
      leftRingDistal.link(gltf, context);
      context.path.removeLast();
    }
    if (leftRingIntermediate != null) {
      context.path.add(LEFT_RING_INTERMEDIATE);
      leftRingIntermediate.link(gltf, context);
      context.path.removeLast();
    }
    if (leftRingProximal != null) {
      context.path.add(LEFT_RING_PROXIMAL);
      leftRingProximal.link(gltf, context);
      context.path.removeLast();
    }
    if (leftShoulder != null) {
      context.path.add(LEFT_SHOULDER);
      leftShoulder.link(gltf, context);
      context.path.removeLast();
    }
    if (leftThumbDistal != null) {
      context.path.add(LEFT_THUMB_DISTAL);
      leftThumbDistal.link(gltf, context);
      context.path.removeLast();
    }
    if (leftThumbIntermediate != null) {
      context.path.add(LEFT_THUMB_INTERMEDIATE);
      leftThumbIntermediate.link(gltf, context);
      context.path.removeLast();
    }
    if (leftThumbProximal != null) {
      context.path.add(LEFT_THUMB_PROXIMAL);
      leftThumbProximal.link(gltf, context);
      context.path.removeLast();
    }
    if (leftToes != null) {
      context.path.add(LEFT_TOES);
      leftToes.link(gltf, context);
      context.path.removeLast();
    }
    if (leftUpperArm != null) {
      context.path.add(LEFT_UPPER_ARM);
      leftUpperArm.link(gltf, context);
      context.path.removeLast();
    }
    if (leftUpperLeg != null) {
      context.path.add(LEFT_UPPER_LEG);
      leftUpperLeg.link(gltf, context);
      context.path.removeLast();
    }
    if (neck != null) {
      context.path.add(NECK);
      neck.link(gltf, context);
      context.path.removeLast();
    }
    if (rightEye != null) {
      context.path.add(RIGHT_EYE);
      rightEye.link(gltf, context);
      context.path.removeLast();
    }
    if (rightFoot != null) {
      context.path.add(RIGHT_FOOT);
      rightFoot.link(gltf, context);
      context.path.removeLast();
    }
    if (rightHand != null) {
      context.path.add(RIGHT_HAND);
      rightHand.link(gltf, context);
      context.path.removeLast();
    }
    if (rightIndexDistal != null) {
      context.path.add(RIGHT_INDEX_DISTAL);
      rightIndexDistal.link(gltf, context);
      context.path.removeLast();
    }
    if (rightIndexIntermediate != null) {
      context.path.add(RIGHT_INDEX_INTERMEDIATE);
      rightIndexIntermediate.link(gltf, context);
      context.path.removeLast();
    }
    if (rightIndexProximal != null) {
      context.path.add(RIGHT_INDEX_PROXIMAL);
      rightIndexProximal.link(gltf, context);
      context.path.removeLast();
    }
    if (rightLittleDistal != null) {
      context.path.add(RIGHT_LITTLE_DISTAL);
      rightLittleDistal.link(gltf, context);
      context.path.removeLast();
    }
    if (rightLittleIntermediate != null) {
      context.path.add(RIGHT_LITTLE_INTERMEDIATE);
      rightLittleIntermediate.link(gltf, context);
      context.path.removeLast();
    }
    if (rightLittleProximal != null) {
      context.path.add(RIGHT_LITTLE_PROXIMAL);
      rightLittleProximal.link(gltf, context);
      context.path.removeLast();
    }
    if (rightLowerArm != null) {
      context.path.add(RIGHT_LOWER_ARM);
      rightLowerArm.link(gltf, context);
      context.path.removeLast();
    }
    if (rightLowerLeg != null) {
      context.path.add(RIGHT_LOWER_LEG);
      rightLowerLeg.link(gltf, context);
      context.path.removeLast();
    }
    if (rightMiddleDistal != null) {
      context.path.add(RIGHT_MIDDLE_DISTAL);
      rightMiddleDistal.link(gltf, context);
      context.path.removeLast();
    }
    if (rightMiddleIntermediate != null) {
      context.path.add(RIGHT_MIDDLE_INTERMEDIATE);
      rightMiddleIntermediate.link(gltf, context);
      context.path.removeLast();
    }
    if (rightMiddleProximal != null) {
      context.path.add(RIGHT_MIDDLE_PROXIMAL);
      rightMiddleProximal.link(gltf, context);
      context.path.removeLast();
    }
    if (rightRingDistal != null) {
      context.path.add(RIGHT_RING_DISTAL);
      rightRingDistal.link(gltf, context);
      context.path.removeLast();
    }
    if (rightRingIntermediate != null) {
      context.path.add(RIGHT_RING_INTERMEDIATE);
      rightRingIntermediate.link(gltf, context);
      context.path.removeLast();
    }
    if (rightRingProximal != null) {
      context.path.add(RIGHT_RING_PROXIMAL);
      rightRingProximal.link(gltf, context);
      context.path.removeLast();
    }
    if (rightShoulder != null) {
      context.path.add(RIGHT_SHOULDER);
      rightShoulder.link(gltf, context);
      context.path.removeLast();
    }
    if (rightThumbDistal != null) {
      context.path.add(RIGHT_THUMB_DISTAL);
      rightThumbDistal.link(gltf, context);
      context.path.removeLast();
    }
    if (rightThumbIntermediate != null) {
      context.path.add(RIGHT_THUMB_INTERMEDIATE);
      rightThumbIntermediate.link(gltf, context);
      context.path.removeLast();
    }
    if (rightThumbProximal != null) {
      context.path.add(RIGHT_THUMB_PROXIMAL);
      rightThumbProximal.link(gltf, context);
      context.path.removeLast();
    }
    if (rightToes != null) {
      context.path.add(RIGHT_TOES);
      rightToes.link(gltf, context);
      context.path.removeLast();
    }
    if (rightUpperArm != null) {
      context.path.add(RIGHT_UPPER_ARM);
      rightUpperArm.link(gltf, context);
      context.path.removeLast();
    }
    if (rightUpperLeg != null) {
      context.path.add(RIGHT_UPPER_LEG);
      rightUpperLeg.link(gltf, context);
      context.path.removeLast();
    }
    if (spine != null) {
      context.path.add(SPINE);
      spine.link(gltf, context);
      context.path.removeLast();
    }
    if (upperChest != null) {
      context.path.add(UPPER_CHEST);
      upperChest.link(gltf, context);
      context.path.removeLast();
    }
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

  HumanBone._(
      this._nodeIndex,
      Map<String, Object> extensions, Object extras)
      : super(extensions, extras);

  static HumanBone fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, HUMAN_BONE_MEMBERS, context);
    }

    return HumanBone._(
        getIndex(map, NODE, context, req: true),
        getExtensions(map, VrmcVrm, context),
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
