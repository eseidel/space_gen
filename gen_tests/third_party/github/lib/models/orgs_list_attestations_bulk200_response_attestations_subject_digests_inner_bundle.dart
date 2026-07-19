// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template orgs_list_attestations_bulk200_response_attestations_subject_digests_inner_bundle}
/// The bundle of the attestation.
/// {@endtemplate}
@immutable
class OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInnerBundle {
  /// {@macro orgs_list_attestations_bulk200_response_attestations_subject_digests_inner_bundle}
  const OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInnerBundle({
    this.mediaType,
    this.verificationMaterial,
    this.dsseEnvelope,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInnerBundle].
  factory OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInnerBundle.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInnerBundle',
      json,
      () =>
          OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInnerBundle(
            mediaType: json['mediaType'] as String?,
            verificationMaterial:
                json['verificationMaterial'] as Map<String, dynamic>?,
            dsseEnvelope: json['dsseEnvelope'] as Map<String, dynamic>?,
          ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInnerBundle?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInnerBundle.fromJson(
      json,
    );
  }

  final String? mediaType;
  final Map<String, dynamic>? verificationMaterial;
  final Map<String, dynamic>? dsseEnvelope;

  /// Converts an [OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInnerBundle]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (mediaType != null) 'mediaType': mediaType,
      if (verificationMaterial != null)
        'verificationMaterial': verificationMaterial,
      if (dsseEnvelope != null) 'dsseEnvelope': dsseEnvelope,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    mediaType,
    mapHash(verificationMaterial),
    mapHash(dsseEnvelope),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInnerBundle &&
        mediaType == other.mediaType &&
        mapsEqual(verificationMaterial, other.verificationMaterial) &&
        mapsEqual(dsseEnvelope, other.dsseEnvelope);
  }
}
