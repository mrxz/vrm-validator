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

// https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0/meta.md
const String NAME = 'name';
const String VERSION = 'version';
const String AUTHORS = 'authors';
const String COPYRIGHT_INFORMATION = 'copyrightInformation';
const String CONTACT_INFORMATION = 'contactInformation';
const String REFERENCES = 'references';
const String THIRD_PARTY_LICENSES = 'thirdPartyLicenses';
const String THUMBNAIL_IMAGE = 'thumbnailImage';
const String LICENSE_URL = 'licenseUrl';
const String AVATAR_PERMISSION = 'avatarPermission';
const String ALLOW_EXCESSIVELY_VIOLENT_USAGE = 'allowExcessivelyViolentUsage';
const String ALLOW_EXCESSIVELY_SEXUAL_USAGE = 'allowExcessivelySexualUsage';
const String COMMERCIAL_USAGE = 'commercialUsage';
const String ALLOW_POLITICAL_OR_RELIGIOUS_USAGE =
    'allowPoliticalOrReligiousUsage';
const String ALLOW_ANTISOCIAL_OR_HATE_USAGE = 'allowAntisocialOrHateUsage';
const String CREDIT_NOTATION = 'creditNotation';
const String ALLOW_REDISTRIBUTION = 'allowRedistribution';
const String MODIFICATION = 'modification';
const String OTHER_LICENSE_URL = 'otherLicenseUrl';

const List<String> VRMC_VRM_META_MEMBERS = <String>[
  NAME,
  VERSION,
  AUTHORS,
  COPYRIGHT_INFORMATION,
  CONTACT_INFORMATION,
  REFERENCES,
  THIRD_PARTY_LICENSES,
  THUMBNAIL_IMAGE,
  LICENSE_URL,
  AVATAR_PERMISSION,
  ALLOW_EXCESSIVELY_VIOLENT_USAGE,
  ALLOW_EXCESSIVELY_SEXUAL_USAGE,
  COMMERCIAL_USAGE,
  ALLOW_POLITICAL_OR_RELIGIOUS_USAGE,
  ALLOW_ANTISOCIAL_OR_HATE_USAGE,
  CREDIT_NOTATION,
  ALLOW_REDISTRIBUTION,
  MODIFICATION,
  OTHER_LICENSE_URL,
];

class VrmcVrmMeta extends GltfProperty implements ResourceValidatable {
  final String name;
  final String version;
  final List<String> authors;
  final String copyrightInformation;
  final String contactInformation;
  final List<String> references;
  final String thirdPartyLicenses;
  final int _thumbnailImageIndex;
  final String licenseUrl;
  final String avatarPermission;
  final bool allowExcessivelyViolentUsage;
  final bool allowExcessivelySexualUsage;
  final String commercialUsage;
  final bool allowPoliticalOrReligiousUsage;
  final bool allowAntisocialOrHateUsage;
  final String creditNotation;
  final bool allowRedistribution;
  final String modification;
  final String otherLicenseUrl;

  Image _thumbnailImage;

  VrmcVrmMeta._(
      this.name,
      this.version,
      this.authors,
      this.copyrightInformation,
      this.contactInformation,
      this.references,
      this.thirdPartyLicenses,
      this._thumbnailImageIndex,
      this.licenseUrl,
      this.avatarPermission,
      this.allowExcessivelyViolentUsage,
      this.allowExcessivelySexualUsage,
      this.commercialUsage,
      this.allowPoliticalOrReligiousUsage,
      this.allowAntisocialOrHateUsage,
      this.creditNotation,
      this.allowRedistribution,
      this.modification,
      this.otherLicenseUrl,
      Map<String, Object> extensions,
      Object extras)
      : super(extensions, extras);

  static VrmcVrmMeta fromMap(Map<String, Object> map, Context context) {
    if (context.validate) {
      checkMembers(map, VRMC_VRM_META_MEMBERS, context);
    }

    return VrmcVrmMeta._(
        getString(map, NAME, context, req: true, regexp: RegExp('.')),
        getString(map, VERSION, context),
        getStringList(map, AUTHORS, context, req: true),
        getString(map, COPYRIGHT_INFORMATION, context),
        getString(map, CONTACT_INFORMATION, context),
        getStringList(map, REFERENCES, context),
        getString(map, THIRD_PARTY_LICENSES, context),
        getIndex(map, THUMBNAIL_IMAGE, context, req: false),
        getString(map, LICENSE_URL, context,
            req: true, list: const ['https://vrm.dev/licenses/1.0/']),
        getString(map, AVATAR_PERMISSION, context, list: const [
          'onlyAuthor',
          'onlySeparatelyLicensedPerson',
          'everyone',
        ]),
        getBool(map, ALLOW_EXCESSIVELY_VIOLENT_USAGE, context),
        getBool(map, ALLOW_EXCESSIVELY_SEXUAL_USAGE, context),
        getString(map, COMMERCIAL_USAGE, context, list: const [
          'personalNonProfit',
          'personalProfit',
          'corporation',
        ]),
        getBool(map, ALLOW_POLITICAL_OR_RELIGIOUS_USAGE, context),
        getBool(map, ALLOW_ANTISOCIAL_OR_HATE_USAGE, context),
        getString(map, CREDIT_NOTATION, context,
            list: const ['required', 'unnecessary']),
        getBool(map, ALLOW_REDISTRIBUTION, context),
        getString(map, MODIFICATION, context, list: const [
          'prohibited',
          'allowModification',
          'allowModificationRedistribution',
        ]),
        getString(map, OTHER_LICENSE_URL, context),
        getExtensions(map, VrmcVrmMeta, context),
        getExtras(map, context));
  }

  @override
  void link(Gltf gltf, Context context) {
    _thumbnailImage = gltf.images[_thumbnailImageIndex];

    if (context.validate && _thumbnailImageIndex != -1) {
      if (_thumbnailImage == null) {
        context.addIssue(LinkError.unresolvedReference,
            name: THUMBNAIL_IMAGE, args: [_thumbnailImageIndex]);
      } else {
        _thumbnailImage.markAsUsed();
      }
    }
  }

  @override
  void validateResources(Gltf gltf, Context context) {
    if (_thumbnailImage == null) {
      return;
    }

    const types = [IMAGE_JPEG, IMAGE_PNG];
    final mimeType = _thumbnailImage.info?.mimeType;
    if (mimeType != null && !types.contains(mimeType)) {
      context.addIssue(SemanticError.vrm1InvalidThumbnailImageMimeType,
          args: [mimeType]);
    }

    final width = _thumbnailImage.info?.width;
    final height = _thumbnailImage.info?.height;
    if (width != 1024 || height != 1024) {
      context.addIssue(SemanticError.vrm1NonRecommendedThumbnailResolution,
          args: [width, height]);
    }
  }
}
