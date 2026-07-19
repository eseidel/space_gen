import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template issue_event_project_card}
/// Issue Event Project Card
/// Issue Event Project Card
/// {@endtemplate}
@immutable
class IssueEventProjectCard {
  /// {@macro issue_event_project_card}
  const IssueEventProjectCard({
    required this.url,
    required this.id,
    required this.projectUrl,
    required this.projectId,
    required this.columnName,
    this.previousColumnName,
  });

  /// Converts a `Map<String, dynamic>` to an [IssueEventProjectCard].
  factory IssueEventProjectCard.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssueEventProjectCard',
      json,
      () => IssueEventProjectCard(
        url: Uri.parse(json['url'] as String),
        id: json['id'] as int,
        projectUrl: Uri.parse(json['project_url'] as String),
        projectId: json['project_id'] as int,
        columnName: json['column_name'] as String,
        previousColumnName: json['previous_column_name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssueEventProjectCard? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssueEventProjectCard.fromJson(json);
  }

  final Uri url;
  final int id;
  final Uri projectUrl;
  final int projectId;
  final String columnName;
  final String? previousColumnName;

  /// Converts an [IssueEventProjectCard] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'id': id,
      'project_url': projectUrl.toString(),
      'project_id': projectId,
      'column_name': columnName,
      'previous_column_name': previousColumnName,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    id,
    projectUrl,
    projectId,
    columnName,
    previousColumnName,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssueEventProjectCard &&
        url == other.url &&
        id == other.id &&
        projectUrl == other.projectUrl &&
        projectId == other.projectId &&
        columnName == other.columnName &&
        previousColumnName == other.previousColumnName;
  }
}
