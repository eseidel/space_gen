import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RemovedFromProjectIssueEventProjectCard {
  const RemovedFromProjectIssueEventProjectCard({
    required this.id,
    required this.url,
    required this.projectId,
    required this.projectUrl,
    required this.columnName,
    this.previousColumnName,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RemovedFromProjectIssueEventProjectCard].
  factory RemovedFromProjectIssueEventProjectCard.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RemovedFromProjectIssueEventProjectCard',
      json,
      () => RemovedFromProjectIssueEventProjectCard(
        id: json['id'] as int,
        url: Uri.parse(json['url'] as String),
        projectId: json['project_id'] as int,
        projectUrl: Uri.parse(json['project_url'] as String),
        columnName: json['column_name'] as String,
        previousColumnName: json['previous_column_name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RemovedFromProjectIssueEventProjectCard? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RemovedFromProjectIssueEventProjectCard.fromJson(json);
  }

  final int id;
  final Uri url;
  final int projectId;
  final Uri projectUrl;
  final String columnName;
  final String? previousColumnName;

  /// Converts a [RemovedFromProjectIssueEventProjectCard]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url.toString(),
      'project_id': projectId,
      'project_url': projectUrl.toString(),
      'column_name': columnName,
      if (previousColumnName != null)
        'previous_column_name': previousColumnName,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    url,
    projectId,
    projectUrl,
    columnName,
    previousColumnName,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RemovedFromProjectIssueEventProjectCard &&
        id == other.id &&
        url == other.url &&
        projectId == other.projectId &&
        projectUrl == other.projectUrl &&
        columnName == other.columnName &&
        previousColumnName == other.previousColumnName;
  }
}
