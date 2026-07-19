import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_secret}
/// Dependabot Secret
/// Set secrets for Dependabot.
/// {@endtemplate}
@immutable
class DependabotSecret {
  /// {@macro dependabot_secret}
  const DependabotSecret({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [DependabotSecret].
  factory DependabotSecret.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DependabotSecret',
      json,
      () => DependabotSecret(
        name: json['name'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotSecret? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DependabotSecret.fromJson(json);
  }

  /// The name of the secret.
  /// Example: `'MY_ARTIFACTORY_PASSWORD'`
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Converts a [DependabotSecret] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, createdAt, updatedAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotSecret &&
        name == other.name &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
