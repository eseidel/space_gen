import 'package:github/model_helpers.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template project_card}
/// Project Card
/// Project cards represent a scope of work.
/// {@endtemplate}
@immutable
class ProjectCard {
  /// {@macro project_card}
  const ProjectCard({
    required this.url,
    required this.id,
    required this.nodeId,
    required this.note,
    required this.creator,
    required this.createdAt,
    required this.updatedAt,
    required this.columnUrl,
    required this.projectUrl,
    this.archived,
    this.columnName,
    this.projectId,
    this.contentUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [ProjectCard].
  factory ProjectCard.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectCard',
      json,
      () => ProjectCard(
        url: Uri.parse(json['url'] as String),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        note: checkedKey(json, 'note') as String?,
        creator: SimpleUser.maybeFromJson(
          checkedKey(json, 'creator') as Map<String, dynamic>?,
        ),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        archived: json['archived'] as bool?,
        columnName: json['column_name'] as String?,
        projectId: json['project_id'] as String?,
        columnUrl: Uri.parse(json['column_url'] as String),
        contentUrl: maybeParseUri(json['content_url'] as String?),
        projectUrl: Uri.parse(json['project_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectCard? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProjectCard.fromJson(json);
  }

  /// Example: `'https://api.github.com/projects/columns/cards/1478'`
  final Uri url;

  /// The project card's ID
  /// Example: `42`
  final int id;

  /// Example: `'MDExOlByb2plY3RDYXJkMTQ3OA=='`
  final String nodeId;

  /// Example: `'Add payload for delete Project column'`
  final String? note;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? creator;

  /// Example: `'2016-09-05T14:21:06Z'`
  final DateTime createdAt;

  /// Example: `'2016-09-05T14:20:22Z'`
  final DateTime updatedAt;

  /// Whether or not the card is archived
  /// Example: `false`
  final bool? archived;
  final String? columnName;
  final String? projectId;

  /// Example: `'https://api.github.com/projects/columns/367'`
  final Uri columnUrl;

  /// Example:
  /// `'https://api.github.com/repos/api-playground/projects-test/issues/3'`
  final Uri? contentUrl;

  /// Example: `'https://api.github.com/projects/120'`
  final Uri projectUrl;

  /// Converts a [ProjectCard] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'id': id,
      'node_id': nodeId,
      'note': note,
      'creator': creator?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'archived': ?archived,
      'column_name': ?columnName,
      'project_id': ?projectId,
      'column_url': columnUrl.toString(),
      'content_url': ?contentUrl?.toString(),
      'project_url': projectUrl.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    id,
    nodeId,
    note,
    creator,
    createdAt,
    updatedAt,
    archived,
    columnName,
    projectId,
    columnUrl,
    contentUrl,
    projectUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectCard &&
        url == other.url &&
        id == other.id &&
        nodeId == other.nodeId &&
        note == other.note &&
        creator == other.creator &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        archived == other.archived &&
        columnName == other.columnName &&
        projectId == other.projectId &&
        columnUrl == other.columnUrl &&
        contentUrl == other.contentUrl &&
        projectUrl == other.projectUrl;
  }
}
