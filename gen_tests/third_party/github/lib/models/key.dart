import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template key}
/// Key
/// Key
/// {@endtemplate}
@immutable
class Key {
  /// {@macro key}
  const Key({
    required this.key,
    required this.id,
    required this.url,
    required this.title,
    required this.createdAt,
    required this.verified,
    required this.readOnly,
  });

  /// Converts a `Map<String, dynamic>` to a [Key].
  factory Key.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Key',
      json,
      () => Key(
        key: json['key'] as String,
        id: json['id'] as int,
        url: json['url'] as String,
        title: json['title'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        verified: json['verified'] as bool,
        readOnly: json['read_only'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Key? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Key.fromJson(json);
  }

  final String key;
  final int id;
  final String url;
  final String title;
  final DateTime createdAt;
  final bool verified;
  final bool readOnly;

  /// Converts a [Key] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'id': id,
      'url': url,
      'title': title,
      'created_at': createdAt.toIso8601String(),
      'verified': verified,
      'read_only': readOnly,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([key, id, url, title, createdAt, verified, readOnly]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Key &&
        key == other.key &&
        id == other.id &&
        url == other.url &&
        title == other.title &&
        createdAt == other.createdAt &&
        verified == other.verified &&
        readOnly == other.readOnly;
  }
}
