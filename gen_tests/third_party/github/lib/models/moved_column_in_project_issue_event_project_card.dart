import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MovedColumnInProjectIssueEventProjectCard {
  const MovedColumnInProjectIssueEventProjectCard({
    required this.id,
    required this.url,
    required this.projectId,
    required this.projectUrl,
    required this.columnName,
    this.previousColumnName,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [MovedColumnInProjectIssueEventProjectCard].
  factory MovedColumnInProjectIssueEventProjectCard.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MovedColumnInProjectIssueEventProjectCard',
      json,
      () => MovedColumnInProjectIssueEventProjectCard(
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
  static MovedColumnInProjectIssueEventProjectCard? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MovedColumnInProjectIssueEventProjectCard.fromJson(json);
  }

  final int id;
  final Uri url;
  final int projectId;
  final Uri projectUrl;
  final String columnName;
  final String? previousColumnName;

  /// Converts a [MovedColumnInProjectIssueEventProjectCard]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url.toString(),
      'project_id': projectId,
      'project_url': projectUrl.toString(),
      'column_name': columnName,
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
    return other is MovedColumnInProjectIssueEventProjectCard &&
        id == other.id &&
        url == other.url &&
        projectId == other.projectId &&
        projectUrl == other.projectUrl &&
        columnName == other.columnName &&
        previousColumnName == other.previousColumnName;
  }
}
