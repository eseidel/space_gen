import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repo_codespaces_secret}
/// Codespaces Secret
/// Set repository secrets for GitHub Codespaces.
/// {@endtemplate}
@immutable
class RepoCodespacesSecret {
  /// {@macro repo_codespaces_secret}
  const RepoCodespacesSecret({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [RepoCodespacesSecret].
  factory RepoCodespacesSecret.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepoCodespacesSecret',
      json,
      () => RepoCodespacesSecret(
        name: json['name'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepoCodespacesSecret? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepoCodespacesSecret.fromJson(json);
  }

  /// The name of the secret.
  /// Example: `'SECRET_TOKEN'`
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Converts a [RepoCodespacesSecret] to a `Map<String, dynamic>`.
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
    return other is RepoCodespacesSecret &&
        name == other.name &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
