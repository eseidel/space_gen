import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template tag_protection}
/// Tag protection
/// Tag protection
/// {@endtemplate}
@immutable
class TagProtection {
  /// {@macro tag_protection}
  const TagProtection({
    required this.pattern,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.enabled,
  });

  /// Converts a `Map<String, dynamic>` to a [TagProtection].
  factory TagProtection.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TagProtection',
      json,
      () => TagProtection(
        id: json['id'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        enabled: json['enabled'] as bool?,
        pattern: json['pattern'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TagProtection? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TagProtection.fromJson(json);
  }

  /// Example: `2`
  final int? id;

  /// Example: `'2011-01-26T19:01:12Z'`
  final String? createdAt;

  /// Example: `'2011-01-26T19:01:12Z'`
  final String? updatedAt;

  /// Example: `true`
  final bool? enabled;

  /// Example: `'v1.*'`
  final String pattern;

  /// Converts a [TagProtection] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'enabled': enabled,
      'pattern': pattern,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, createdAt, updatedAt, enabled, pattern]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TagProtection &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        enabled == other.enabled &&
        pattern == other.pattern;
  }
}
