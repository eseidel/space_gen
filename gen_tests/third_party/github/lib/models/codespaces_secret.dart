import 'package:github/model_helpers.dart';
import 'package:github/models/codespaces_secret_visibility.dart';
import 'package:meta/meta.dart';

/// {@template codespaces_secret}
/// Codespaces Secret
/// Secrets for a GitHub Codespace.
/// {@endtemplate}
@immutable
class CodespacesSecret {
  /// {@macro codespaces_secret}
  const CodespacesSecret({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.visibility,
    required this.selectedRepositoriesUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [CodespacesSecret].
  factory CodespacesSecret.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodespacesSecret',
      json,
      () => CodespacesSecret(
        name: json['name'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        visibility: CodespacesSecretVisibility.fromJson(
          json['visibility'] as String,
        ),
        selectedRepositoriesUrl: Uri.parse(
          json['selected_repositories_url'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesSecret? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesSecret.fromJson(json);
  }

  /// The name of the secret
  /// Example: `'SECRET_NAME'`
  final String name;

  /// The date and time at which the secret was created, in ISO 8601 format':'
  /// YYYY-MM-DDTHH:MM:SSZ.
  final DateTime createdAt;

  /// The date and time at which the secret was last updated, in ISO 8601
  /// format':' YYYY-MM-DDTHH:MM:SSZ.
  final DateTime updatedAt;

  /// The type of repositories in the organization that the secret is visible
  /// to
  final CodespacesSecretVisibility visibility;

  /// The API URL at which the list of repositories this secret is visible to
  /// can be retrieved
  /// Example:
  /// `'https://api.github.com/user/secrets/SECRET_NAME/repositories'`
  final Uri selectedRepositoriesUrl;

  /// Converts a [CodespacesSecret] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'visibility': visibility.toJson(),
      'selected_repositories_url': selectedRepositoriesUrl.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    createdAt,
    updatedAt,
    visibility,
    selectedRepositoriesUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesSecret &&
        name == other.name &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        visibility == other.visibility &&
        selectedRepositoriesUrl == other.selectedRepositoriesUrl;
  }
}
