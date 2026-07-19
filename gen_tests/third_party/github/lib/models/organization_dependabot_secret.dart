// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/organization_dependabot_secret_visibility.dart';
import 'package:meta/meta.dart';

/// {@template organization_dependabot_secret}
/// Dependabot Secret for an Organization
/// Secrets for GitHub Dependabot for an organization.
/// {@endtemplate}
@immutable
class OrganizationDependabotSecret {
  /// {@macro organization_dependabot_secret}
  const OrganizationDependabotSecret({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.visibility,
    this.selectedRepositoriesUrl,
  });

  /// Converts a `Map<String, dynamic>` to an [OrganizationDependabotSecret].
  factory OrganizationDependabotSecret.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrganizationDependabotSecret',
      json,
      () => OrganizationDependabotSecret(
        name: json['name'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        visibility: OrganizationDependabotSecretVisibility.fromJson(
          json['visibility'] as String,
        ),
        selectedRepositoriesUrl: maybeParseUri(
          json['selected_repositories_url'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrganizationDependabotSecret? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrganizationDependabotSecret.fromJson(json);
  }

  /// The name of the secret.
  /// Example: `'SECRET_TOKEN'`
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Visibility of a secret
  final OrganizationDependabotSecretVisibility visibility;

  /// Example:
  /// `'https://api.github.com/organizations/org/dependabot/secrets/my_secret/repositories'`
  final Uri? selectedRepositoriesUrl;

  /// Converts an [OrganizationDependabotSecret] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'visibility': visibility.toJson(),
      'selected_repositories_url': selectedRepositoriesUrl?.toString(),
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
    return other is OrganizationDependabotSecret &&
        name == other.name &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        visibility == other.visibility &&
        selectedRepositoriesUrl == other.selectedRepositoriesUrl;
  }
}
