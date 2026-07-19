import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template organization_programmatic_access_grant_request_permissions}
/// Permissions requested, categorized by type of permission.
/// {@endtemplate}
@immutable
class OrganizationProgrammaticAccessGrantRequestPermissions {
  /// {@macro organization_programmatic_access_grant_request_permissions}
  const OrganizationProgrammaticAccessGrantRequestPermissions({
    this.organization,
    this.repository,
    this.other,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrganizationProgrammaticAccessGrantRequestPermissions].
  factory OrganizationProgrammaticAccessGrantRequestPermissions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrganizationProgrammaticAccessGrantRequestPermissions',
      json,
      () => OrganizationProgrammaticAccessGrantRequestPermissions(
        organization: (json['organization'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        repository: (json['repository'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        other: (json['other'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrganizationProgrammaticAccessGrantRequestPermissions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrganizationProgrammaticAccessGrantRequestPermissions.fromJson(json);
  }

  final Map<String, String>? organization;
  final Map<String, String>? repository;
  final Map<String, String>? other;

  /// Converts an [OrganizationProgrammaticAccessGrantRequestPermissions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (organization != null) 'organization': organization,
      if (repository != null) 'repository': repository,
      if (other != null) 'other': other,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    mapHash(organization),
    mapHash(repository),
    mapHash(other),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrganizationProgrammaticAccessGrantRequestPermissions &&
        mapsEqual(organization, other.organization) &&
        mapsEqual(repository, other.repository) &&
        mapsEqual(this.other, other.other);
  }
}
