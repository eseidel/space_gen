import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template codespaces_public_key}
/// CodespacesPublicKey
/// The public key used for setting Codespaces secrets.
/// {@endtemplate}
@immutable
class CodespacesPublicKey {
  /// {@macro codespaces_public_key}
  const CodespacesPublicKey({
    required this.keyId,
    required this.key,
    this.id,
    this.url,
    this.title,
    this.createdAt,
  });

  /// Converts a `Map<String, dynamic>` to a [CodespacesPublicKey].
  factory CodespacesPublicKey.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodespacesPublicKey',
      json,
      () => CodespacesPublicKey(
        keyId: json['key_id'] as String,
        key: json['key'] as String,
        id: json['id'] as int?,
        url: json['url'] as String?,
        title: json['title'] as String?,
        createdAt: json['created_at'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesPublicKey? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesPublicKey.fromJson(json);
  }

  /// The identifier for the key.
  /// Example: `'1234567'`
  final String keyId;

  /// The Base64 encoded public key.
  /// Example: `'hBT5WZEj8ZoOv6TYJsfWq7MxTEQopZO5/IT3ZCVQPzs='`
  final String key;

  /// Example: `2`
  final int? id;

  /// Example: `'https://api.github.com/user/keys/2'`
  final String? url;

  /// Example: `'ssh-rsa AAAAB3NzaC1yc2EAAA'`
  final String? title;

  /// Example: `'2011-01-26T19:01:12Z'`
  final String? createdAt;

  /// Converts a [CodespacesPublicKey] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'key_id': keyId,
      'key': key,
      'id': id,
      'url': url,
      'title': title,
      'created_at': createdAt,
    };
  }

  @override
  int get hashCode => Object.hashAll([keyId, key, id, url, title, createdAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesPublicKey &&
        keyId == other.keyId &&
        key == other.key &&
        id == other.id &&
        url == other.url &&
        title == other.title &&
        createdAt == other.createdAt;
  }
}
