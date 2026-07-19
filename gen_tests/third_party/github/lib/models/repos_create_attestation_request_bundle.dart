// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_create_attestation_request_bundle}
/// The attestation's Sigstore Bundle.
/// Refer to the [Sigstore Bundle
/// Specification](https://github.com/sigstore/protobuf-specs/blob/main/protos/sigstore_bundle.proto)
/// for more information.
/// {@endtemplate}
@immutable
class ReposCreateAttestationRequestBundle {
  /// {@macro repos_create_attestation_request_bundle}
  const ReposCreateAttestationRequestBundle({
    this.mediaType,
    this.verificationMaterial,
    this.dsseEnvelope,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreateAttestationRequestBundle].
  factory ReposCreateAttestationRequestBundle.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreateAttestationRequestBundle',
      json,
      () => ReposCreateAttestationRequestBundle(
        mediaType: json['mediaType'] as String?,
        verificationMaterial:
            json['verificationMaterial'] as Map<String, dynamic>?,
        dsseEnvelope: json['dsseEnvelope'] as Map<String, dynamic>?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateAttestationRequestBundle? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateAttestationRequestBundle.fromJson(json);
  }

  final String? mediaType;
  final Map<String, dynamic>? verificationMaterial;
  final Map<String, dynamic>? dsseEnvelope;

  /// Converts a [ReposCreateAttestationRequestBundle]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'mediaType': mediaType,
      'verificationMaterial': verificationMaterial,
      'dsseEnvelope': dsseEnvelope,
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
    return other is ReposCreateAttestationRequestBundle &&
        mediaType == other.mediaType &&
        mapsEqual(verificationMaterial, other.verificationMaterial) &&
        mapsEqual(dsseEnvelope, other.dsseEnvelope);
  }
}
