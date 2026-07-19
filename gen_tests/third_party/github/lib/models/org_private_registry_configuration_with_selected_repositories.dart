// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/org_private_registry_configuration_with_selected_repositories_registry_type.dart';
import 'package:github/models/org_private_registry_configuration_with_selected_repositories_visibility.dart';
import 'package:meta/meta.dart';

/// {@template org_private_registry_configuration_with_selected_repositories}
/// Organization private registry
/// Private registry configuration for an organization
/// {@endtemplate}
@immutable
class OrgPrivateRegistryConfigurationWithSelectedRepositories {
  /// {@macro org_private_registry_configuration_with_selected_repositories}
  const OrgPrivateRegistryConfigurationWithSelectedRepositories({
    required this.name,
    required this.registryType,
    required this.visibility,
    required this.createdAt,
    required this.updatedAt,
    this.username,
    this.selectedRepositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgPrivateRegistryConfigurationWithSelectedRepositories].
  factory OrgPrivateRegistryConfigurationWithSelectedRepositories.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgPrivateRegistryConfigurationWithSelectedRepositories',
      json,
      () => OrgPrivateRegistryConfigurationWithSelectedRepositories(
        name: json['name'] as String,
        registryType:
            OrgPrivateRegistryConfigurationWithSelectedRepositoriesRegistryType.fromJson(
              json['registry_type'] as String,
            ),
        username: json['username'] as String?,
        visibility:
            OrgPrivateRegistryConfigurationWithSelectedRepositoriesVisibility.fromJson(
              json['visibility'] as String,
            ),
        selectedRepositoryIds: (json['selected_repository_ids'] as List?)
            ?.cast<int>(),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgPrivateRegistryConfigurationWithSelectedRepositories? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgPrivateRegistryConfigurationWithSelectedRepositories.fromJson(
      json,
    );
  }

  /// The name of the private registry configuration.
  /// Example: `'MAVEN_REPOSITORY_SECRET'`
  final String name;

  /// The registry type.
  final OrgPrivateRegistryConfigurationWithSelectedRepositoriesRegistryType
  registryType;

  /// The username to use when authenticating with the private registry.
  /// Example: `'monalisa'`
  final String? username;

  /// Which type of organization repositories have access to the private
  /// registry. `selected` means only the repositories specified by
  /// `selected_repository_ids` can access the private registry.
  final OrgPrivateRegistryConfigurationWithSelectedRepositoriesVisibility
  visibility;

  /// An array of repository IDs that can access the organization private
  /// registry when `visibility` is set to `selected`.
  final List<int>? selectedRepositoryIds;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Converts an [OrgPrivateRegistryConfigurationWithSelectedRepositories]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'registry_type': registryType.toJson(),
      if (username != null) 'username': username,
      'visibility': visibility.toJson(),
      if (selectedRepositoryIds != null)
        'selected_repository_ids': selectedRepositoryIds,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    registryType,
    username,
    visibility,
    listHash(selectedRepositoryIds),
    createdAt,
    updatedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgPrivateRegistryConfigurationWithSelectedRepositories &&
        name == other.name &&
        registryType == other.registryType &&
        username == other.username &&
        visibility == other.visibility &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds) &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
