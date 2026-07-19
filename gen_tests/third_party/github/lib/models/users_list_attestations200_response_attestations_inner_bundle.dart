// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template users_list_attestations200_response_attestations_inner_bundle}
/// The attestation's Sigstore Bundle.
/// Refer to the [Sigstore Bundle
/// Specification](https://github.com/sigstore/protobuf-specs/blob/main/protos/sigstore_bundle.proto)
/// for more information.
/// {@endtemplate}
@immutable
class UsersListAttestations200ResponseAttestationsInnerBundle {
  /// {@macro users_list_attestations200_response_attestations_inner_bundle}
  const UsersListAttestations200ResponseAttestationsInnerBundle({
    this.mediaType,
    this.verificationMaterial,
    this.dsseEnvelope,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersListAttestations200ResponseAttestationsInnerBundle].
  factory UsersListAttestations200ResponseAttestationsInnerBundle.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersListAttestations200ResponseAttestationsInnerBundle',
      json,
      () => UsersListAttestations200ResponseAttestationsInnerBundle(
        mediaType: json['mediaType'] as String?,
        verificationMaterial:
            json['verificationMaterial'] as Map<String, dynamic>?,
        dsseEnvelope: json['dsseEnvelope'] as Map<String, dynamic>?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersListAttestations200ResponseAttestationsInnerBundle? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersListAttestations200ResponseAttestationsInnerBundle.fromJson(
      json,
    );
  }

  final String? mediaType;
  final Map<String, dynamic>? verificationMaterial;
  final Map<String, dynamic>? dsseEnvelope;

  /// Converts a [UsersListAttestations200ResponseAttestationsInnerBundle]
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
    return other is UsersListAttestations200ResponseAttestationsInnerBundle &&
        mediaType == other.mediaType &&
        mapsEqual(verificationMaterial, other.verificationMaterial) &&
        mapsEqual(dsseEnvelope, other.dsseEnvelope);
  }
}
