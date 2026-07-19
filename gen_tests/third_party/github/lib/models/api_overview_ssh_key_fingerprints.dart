import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApiOverviewSshKeyFingerprints {
  const ApiOverviewSshKeyFingerprints({
    this.sha256Rsa,
    this.sha256Dsa,
    this.sha256Ecdsa,
    this.sha256Ed25519,
  });

  /// Converts a `Map<String, dynamic>` to an [ApiOverviewSshKeyFingerprints].
  factory ApiOverviewSshKeyFingerprints.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApiOverviewSshKeyFingerprints',
      json,
      () => ApiOverviewSshKeyFingerprints(
        sha256Rsa: json['SHA256_RSA'] as String?,
        sha256Dsa: json['SHA256_DSA'] as String?,
        sha256Ecdsa: json['SHA256_ECDSA'] as String?,
        sha256Ed25519: json['SHA256_ED25519'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiOverviewSshKeyFingerprints? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApiOverviewSshKeyFingerprints.fromJson(json);
  }

  final String? sha256Rsa;
  final String? sha256Dsa;
  final String? sha256Ecdsa;
  final String? sha256Ed25519;

  /// Converts an [ApiOverviewSshKeyFingerprints] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'SHA256_RSA': sha256Rsa,
      'SHA256_DSA': sha256Dsa,
      'SHA256_ECDSA': sha256Ecdsa,
      'SHA256_ED25519': sha256Ed25519,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([sha256Rsa, sha256Dsa, sha256Ecdsa, sha256Ed25519]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiOverviewSshKeyFingerprints &&
        sha256Rsa == other.sha256Rsa &&
        sha256Dsa == other.sha256Dsa &&
        sha256Ecdsa == other.sha256Ecdsa &&
        sha256Ed25519 == other.sha256Ed25519;
  }
}
