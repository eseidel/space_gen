import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_public_key}
/// DependabotPublicKey
/// The public key used for setting Dependabot Secrets.
/// {@endtemplate}
@immutable
class DependabotPublicKey {
  /// {@macro dependabot_public_key}
  const DependabotPublicKey({required this.keyId, required this.key});

  /// Converts a `Map<String, dynamic>` to a [DependabotPublicKey].
  factory DependabotPublicKey.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DependabotPublicKey',
      json,
      () => DependabotPublicKey(
        keyId: json['key_id'] as String,
        key: json['key'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotPublicKey? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DependabotPublicKey.fromJson(json);
  }

  /// The identifier for the key.
  /// Example: `'1234567'`
  final String keyId;

  /// The Base64 encoded public key.
  /// Example: `'hBT5WZEj8ZoOv6TYJsfWq7MxTEQopZO5/IT3ZCVQPzs='`
  final String key;

  /// Converts a [DependabotPublicKey] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'key_id': keyId, 'key': key};
  }

  @override
  int get hashCode => Object.hashAll([keyId, key]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotPublicKey &&
        keyId == other.keyId &&
        key == other.key;
  }
}
