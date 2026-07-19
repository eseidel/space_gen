import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template actions_secret}
/// Actions Secret
/// Set secrets for GitHub Actions.
/// {@endtemplate}
@immutable
class ActionsSecret {
  /// {@macro actions_secret}
  const ActionsSecret({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsSecret].
  factory ActionsSecret.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsSecret',
      json,
      () => ActionsSecret(
        name: json['name'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsSecret? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ActionsSecret.fromJson(json);
  }

  /// The name of the secret.
  /// Example: `'SECRET_TOKEN'`
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Converts an [ActionsSecret] to a `Map<String, dynamic>`.
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
    return other is ActionsSecret &&
        name == other.name &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
