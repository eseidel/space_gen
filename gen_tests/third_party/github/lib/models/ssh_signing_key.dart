import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template ssh_signing_key}
/// SSH Signing Key
/// A public SSH key used to sign Git commits
/// {@endtemplate}
@immutable
class SshSigningKey {
  /// {@macro ssh_signing_key}
  const SshSigningKey({
    required this.key,
    required this.id,
    required this.title,
    required this.createdAt,
  });

  /// Converts a `Map<String, dynamic>` to a [SshSigningKey].
  factory SshSigningKey.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SshSigningKey',
      json,
      () => SshSigningKey(
        key: json['key'] as String,
        id: json['id'] as int,
        title: json['title'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SshSigningKey? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SshSigningKey.fromJson(json);
  }

  final String key;
  final int id;
  final String title;
  final DateTime createdAt;

  /// Converts a [SshSigningKey] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'id': id,
      'title': title,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([key, id, title, createdAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SshSigningKey &&
        key == other.key &&
        id == other.id &&
        title == other.title &&
        createdAt == other.createdAt;
  }
}
