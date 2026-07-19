import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template organization_programmatic_access_grant_permissions}
/// Permissions requested, categorized by type of permission.
/// {@endtemplate}
@immutable
class OrganizationProgrammaticAccessGrantPermissions {
  /// {@macro organization_programmatic_access_grant_permissions}
  const OrganizationProgrammaticAccessGrantPermissions({
    this.organization,
    this.repository,
    this.other,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrganizationProgrammaticAccessGrantPermissions].
  factory OrganizationProgrammaticAccessGrantPermissions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrganizationProgrammaticAccessGrantPermissions',
      json,
      () => OrganizationProgrammaticAccessGrantPermissions(
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
  static OrganizationProgrammaticAccessGrantPermissions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrganizationProgrammaticAccessGrantPermissions.fromJson(json);
  }

  final Map<String, String>? organization;
  final Map<String, String>? repository;
  final Map<String, String>? other;

  /// Converts an [OrganizationProgrammaticAccessGrantPermissions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'organization': organization,
      'repository': repository,
      'other': other,
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
    return other is OrganizationProgrammaticAccessGrantPermissions &&
        mapsEqual(organization, other.organization) &&
        mapsEqual(repository, other.repository) &&
        mapsEqual(this.other, other.other);
  }
}
