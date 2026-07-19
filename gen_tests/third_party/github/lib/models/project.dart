// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/project_organization_permission.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template project}
/// Project
/// Projects are a way to organize columns and cards of work.
/// {@endtemplate}
@immutable
class Project {
  /// {@macro project}
  const Project({
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
    this.organizationPermission,
    this.private,
  });

  /// Converts a `Map<String, dynamic>` to a [Project].
  factory Project.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Project',
      json,
      () => Project(
        ownerUrl: Uri.parse(json['owner_url'] as String),
        url: Uri.parse(json['url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        columnsUrl: Uri.parse(json['columns_url'] as String),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        name: json['name'] as String,
        body: checkedKey(json, 'body') as String?,
        number: json['number'] as int,
        state: json['state'] as String,
        creator: SimpleUser.maybeFromJson(
          checkedKey(json, 'creator') as Map<String, dynamic>?,
        ),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        organizationPermission: ProjectOrganizationPermission.maybeFromJson(
          json['organization_permission'] as String?,
        ),
        private: json['private'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Project? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Project.fromJson(json);
  }

  /// Example: `'https://api.github.com/repos/api-playground/projects-test'`
  final Uri ownerUrl;

  /// Example: `'https://api.github.com/projects/1002604'`
  final Uri url;

  /// Example: `'https://github.com/api-playground/projects-test/projects/12'`
  final Uri htmlUrl;

  /// Example: `'https://api.github.com/projects/1002604/columns'`
  final Uri columnsUrl;

  /// Example: `1002604`
  final int id;

  /// Example: `'MDc6UHJvamVjdDEwMDI2MDQ='`
  final String nodeId;

  /// Name of the project
  /// Example: `'Week One Sprint'`
  final String name;

  /// Body of the project
  /// Example: `'This project represents the sprint of the first week in January'`
  final String? body;

  /// Example: `1`
  final int number;

  /// State of the project; either 'open' or 'closed'
  /// Example: `'open'`
  final String state;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? creator;

  /// Example: `'2011-04-10T20:09:31Z'`
  final DateTime createdAt;

  /// Example: `'2014-03-03T18:58:10Z'`
  final DateTime updatedAt;

  /// The baseline permission that all organization members have on this
  /// project. Only present if owner is an organization.
  final ProjectOrganizationPermission? organizationPermission;

  /// Whether or not this project can be seen by everyone. Only present if
  /// owner is an organization.
  final bool? private;

  /// Converts a [Project] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'owner_url': ownerUrl.toString(),
      'url': url.toString(),
      'html_url': htmlUrl.toString(),
      'columns_url': columnsUrl.toString(),
      'id': id,
      'node_id': nodeId,
      'name': name,
      'body': body,
      'number': number,
      'state': state,
      'creator': creator?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'organization_permission': organizationPermission?.toJson(),
      'private': private,
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
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Project &&
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
        private == other.private;
  }
}
