import 'package:github/model_helpers.dart';
import 'package:github/models/organization_role_base_role.dart';
import 'package:github/models/organization_role_source.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template organization_role}
/// Organization Role
/// Organization roles
/// {@endtemplate}
@immutable
class OrganizationRole {
  /// {@macro organization_role}
  const OrganizationRole({
    required this.id,
    required this.name,
    required this.permissions,
    required this.organization,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.baseRole,
    this.source,
  });

  /// Converts a `Map<String, dynamic>` to an [OrganizationRole].
  factory OrganizationRole.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrganizationRole',
      json,
      () => OrganizationRole(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String?,
        baseRole: OrganizationRoleBaseRole.maybeFromJson(
          json['base_role'] as String?,
        ),
        source: OrganizationRoleSource.maybeFromJson(json['source'] as String?),
        permissions: (json['permissions'] as List).cast<String>(),
        organization: SimpleUser.maybeFromJson(
          checkedKey(json, 'organization') as Map<String, dynamic>?,
        ),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrganizationRole? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrganizationRole.fromJson(json);
  }

  /// The unique identifier of the role.
  final int id;

  /// The name of the role.
  final String name;

  /// A short description about who this role is for or what permissions it
  /// grants.
  final String? description;

  /// The system role from which this role inherits permissions.
  final OrganizationRoleBaseRole? baseRole;

  /// Source answers the question, "where did this role come from?"
  final OrganizationRoleSource? source;

  /// A list of permissions included in this role.
  final List<String> permissions;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? organization;

  /// The date and time the role was created.
  final DateTime createdAt;

  /// The date and time the role was last updated.
  final DateTime updatedAt;

  /// Converts an [OrganizationRole] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'base_role': baseRole?.toJson(),
      'source': source?.toJson(),
      'permissions': permissions,
      'organization': organization?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    description,
    baseRole,
    source,
    listHash(permissions),
    organization,
    createdAt,
    updatedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrganizationRole &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        baseRole == other.baseRole &&
        source == other.source &&
        listsEqual(permissions, other.permissions) &&
        organization == other.organization &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
