import 'package:github/model_helpers.dart';
import 'package:github/models/org_private_registry_configuration_registry_type.dart';
import 'package:github/models/org_private_registry_configuration_visibility.dart';
import 'package:meta/meta.dart';

/// {@template org_private_registry_configuration}
/// Organization private registry
/// Private registry configuration for an organization
/// {@endtemplate}
@immutable
class OrgPrivateRegistryConfiguration {
  /// {@macro org_private_registry_configuration}
  const OrgPrivateRegistryConfiguration({
    required this.name,
    required this.registryType,
    required this.visibility,
    required this.createdAt,
    required this.updatedAt,
    this.username,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgPrivateRegistryConfiguration].
  factory OrgPrivateRegistryConfiguration.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgPrivateRegistryConfiguration',
      json,
      () => OrgPrivateRegistryConfiguration(
        name: json['name'] as String,
        registryType: OrgPrivateRegistryConfigurationRegistryType.fromJson(
          json['registry_type'] as String,
        ),
        username: json['username'] as String?,
        visibility: OrgPrivateRegistryConfigurationVisibility.fromJson(
          json['visibility'] as String,
        ),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgPrivateRegistryConfiguration? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgPrivateRegistryConfiguration.fromJson(json);
  }

  /// The name of the private registry configuration.
  /// Example: `'MAVEN_REPOSITORY_SECRET'`
  final String name;

  /// The registry type.
  final OrgPrivateRegistryConfigurationRegistryType registryType;

  /// The username to use when authenticating with the private registry.
  /// Example: `'monalisa'`
  final String? username;

  /// Which type of organization repositories have access to the private
  /// registry.
  final OrgPrivateRegistryConfigurationVisibility visibility;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Converts an [OrgPrivateRegistryConfiguration] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'registry_type': registryType.toJson(),
      'username': username,
      'visibility': visibility.toJson(),
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
    createdAt,
    updatedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgPrivateRegistryConfiguration &&
        name == other.name &&
        registryType == other.registryType &&
        username == other.username &&
        visibility == other.visibility &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
