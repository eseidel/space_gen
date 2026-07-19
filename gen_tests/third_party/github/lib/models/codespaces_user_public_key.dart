import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template codespaces_user_public_key}
/// CodespacesUserPublicKey
/// The public key used for setting user Codespaces' Secrets.
/// {@endtemplate}
@immutable
class CodespacesUserPublicKey {
  /// {@macro codespaces_user_public_key}
  const CodespacesUserPublicKey({required this.keyId, required this.key});

  /// Converts a `Map<String, dynamic>` to a [CodespacesUserPublicKey].
  factory CodespacesUserPublicKey.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodespacesUserPublicKey',
      json,
      () => CodespacesUserPublicKey(
        keyId: json['key_id'] as String,
        key: json['key'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesUserPublicKey? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesUserPublicKey.fromJson(json);
  }

  /// The identifier for the key.
  /// Example: `'1234567'`
  final String keyId;

  /// The Base64 encoded public key.
  /// Example: `'hBT5WZEj8ZoOv6TYJsfWq7MxTEQopZO5/IT3ZCVQPzs='`
  final String key;

  /// Converts a [CodespacesUserPublicKey] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'key_id': keyId, 'key': key};
  }

  @override
  int get hashCode => Object.hashAll([keyId, key]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesUserPublicKey &&
        keyId == other.keyId &&
        key == other.key;
  }
}
