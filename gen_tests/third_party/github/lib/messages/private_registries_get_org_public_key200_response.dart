// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PrivateRegistriesGetOrgPublicKey200Response {
  const PrivateRegistriesGetOrgPublicKey200Response({
    required this.keyId,
    required this.key,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [PrivateRegistriesGetOrgPublicKey200Response].
  factory PrivateRegistriesGetOrgPublicKey200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PrivateRegistriesGetOrgPublicKey200Response',
      json,
      () => PrivateRegistriesGetOrgPublicKey200Response(
        keyId: json['key_id'] as String,
        key: json['key'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PrivateRegistriesGetOrgPublicKey200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PrivateRegistriesGetOrgPublicKey200Response.fromJson(json);
  }

  /// The identifier for the key.
  /// Example: `'012345678912345678'`
  final String keyId;

  /// The Base64 encoded public key.
  /// Example: `'2Sg8iYjAxxmI2LvUXpJjkYrMxURPc8r+dB7TJyvv1234'`
  final String key;

  /// Converts a [PrivateRegistriesGetOrgPublicKey200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'key_id': keyId, 'key': key};
  }

  @override
  int get hashCode => Object.hashAll([keyId, key]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrivateRegistriesGetOrgPublicKey200Response &&
        keyId == other.keyId &&
        key == other.key;
  }
}
