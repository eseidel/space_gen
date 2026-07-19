import 'package:github/model_helpers.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team_project_permissions.dart';
import 'package:meta/meta.dart';

/// {@template team_project}
/// Team Project
/// A team's access to a project.
/// {@endtemplate}
@immutable
class TeamProject {
  /// {@macro team_project}
  const TeamProject({
    required this.ownerUrl,
    required this.url,
    required this.htmlUrl,
    required this.columnsUrl,
    required this.id,
    required this.nodeId,
    required this.name,
    required this.body,
    required this.number,
    required this.state,
    required this.creator,
    required this.createdAt,
    required this.updatedAt,
    required this.permissions,
    this.organizationPermission,
    this.private,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamProject].
  factory TeamProject.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamProject',
      json,
      () => TeamProject(
        ownerUrl: json['owner_url'] as String,
        url: json['url'] as String,
        htmlUrl: json['html_url'] as String,
        columnsUrl: json['columns_url'] as String,
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        name: json['name'] as String,
        body: checkedKey(json, 'body') as String?,
        number: json['number'] as int,
        state: json['state'] as String,
        creator: SimpleUser.fromJson(json['creator'] as Map<String, dynamic>),
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
        organizationPermission: json['organization_permission'] as String?,
        private: json['private'] as bool?,
        permissions: TeamProjectPermissions.fromJson(
          json['permissions'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamProject? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamProject.fromJson(json);
  }

  final String ownerUrl;
  final String url;
  final String htmlUrl;
  final String columnsUrl;
  final int id;
  final String nodeId;
  final String name;
  final String? body;
  final int number;
  final String state;

  /// Simple User
  /// A GitHub user.
  final SimpleUser creator;
  final String createdAt;
  final String updatedAt;

  /// The organization permission for this project. Only present when owner is
  /// an organization.
  final String? organizationPermission;

  /// Whether the project is private or not. Only present when owner is an
  /// organization.
  final bool? private;
  final TeamProjectPermissions permissions;

  /// Converts a [TeamProject] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'owner_url': ownerUrl,
      'url': url,
      'html_url': htmlUrl,
      'columns_url': columnsUrl,
      'id': id,
      'node_id': nodeId,
      'name': name,
      'body': body,
      'number': number,
      'state': state,
      'creator': creator.toJson(),
      'created_at': createdAt,
      'updated_at': updatedAt,
      if (organizationPermission != null)
        'organization_permission': organizationPermission,
      if (private != null) 'private': private,
      'permissions': permissions.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    ownerUrl,
    url,
    htmlUrl,
    columnsUrl,
    id,
    nodeId,
    name,
    body,
    number,
    state,
    creator,
    createdAt,
    updatedAt,
    organizationPermission,
    private,
    permissions,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamProject &&
        ownerUrl == other.ownerUrl &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        columnsUrl == other.columnsUrl &&
        id == other.id &&
        nodeId == other.nodeId &&
        name == other.name &&
        body == other.body &&
        number == other.number &&
        state == other.state &&
        creator == other.creator &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        organizationPermission == other.organizationPermission &&
        private == other.private &&
        permissions == other.permissions;
  }
}
