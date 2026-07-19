import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template project_column}
/// Project Column
/// Project columns contain cards of work.
/// {@endtemplate}
@immutable
class ProjectColumn {
  /// {@macro project_column}
  const ProjectColumn({
    required this.url,
    required this.projectUrl,
    required this.cardsUrl,
    required this.id,
    required this.nodeId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [ProjectColumn].
  factory ProjectColumn.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectColumn',
      json,
      () => ProjectColumn(
        url: Uri.parse(json['url'] as String),
        projectUrl: Uri.parse(json['project_url'] as String),
        cardsUrl: Uri.parse(json['cards_url'] as String),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        name: json['name'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectColumn? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProjectColumn.fromJson(json);
  }

  /// Example: `'https://api.github.com/projects/columns/367'`
  final Uri url;

  /// Example: `'https://api.github.com/projects/120'`
  final Uri projectUrl;

  /// Example: `'https://api.github.com/projects/columns/367/cards'`
  final Uri cardsUrl;

  /// The unique identifier of the project column
  /// Example: `42`
  final int id;

  /// Example: `'MDEzOlByb2plY3RDb2x1bW4zNjc='`
  final String nodeId;

  /// Name of the project column
  /// Example: `'Remaining tasks'`
  final String name;

  /// Example: `'2016-09-05T14:18:44Z'`
  final DateTime createdAt;

  /// Example: `'2016-09-05T14:22:28Z'`
  final DateTime updatedAt;

  /// Converts a [ProjectColumn] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'project_url': projectUrl.toString(),
      'cards_url': cardsUrl.toString(),
      'id': id,
      'node_id': nodeId,
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    projectUrl,
    cardsUrl,
    id,
    nodeId,
    name,
    createdAt,
    updatedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectColumn &&
        url == other.url &&
        projectUrl == other.projectUrl &&
        cardsUrl == other.cardsUrl &&
        id == other.id &&
        nodeId == other.nodeId &&
        name == other.name &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
