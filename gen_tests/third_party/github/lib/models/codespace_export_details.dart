import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template codespace_export_details}
/// Fetches information about an export of a codespace.
/// An export of a codespace. Also, latest export details for a codespace can be
/// fetched with id = latest
/// {@endtemplate}
@immutable
class CodespaceExportDetails {
  /// {@macro codespace_export_details}
  const CodespaceExportDetails({
    this.state,
    this.completedAt,
    this.branch,
    this.sha,
    this.id,
    this.exportUrl,
    this.htmlUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [CodespaceExportDetails].
  factory CodespaceExportDetails.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodespaceExportDetails',
      json,
      () => CodespaceExportDetails(
        state: json['state'] as String?,
        completedAt: maybeParseDateTime(json['completed_at'] as String?),
        branch: json['branch'] as String?,
        sha: json['sha'] as String?,
        id: json['id'] as String?,
        exportUrl: json['export_url'] as String?,
        htmlUrl: json['html_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespaceExportDetails? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespaceExportDetails.fromJson(json);
  }

  /// State of the latest export
  /// Example: `'succeeded | failed | in_progress'`
  final String? state;

  /// Completion time of the last export operation
  /// Example: `'2021-01-01T19:01:12Z'`
  final DateTime? completedAt;

  /// Name of the exported branch
  /// Example: `'codespace-monalisa-octocat-hello-world-g4wpq6h95q'`
  final String? branch;

  /// Git commit SHA of the exported branch
  /// Example: `'fd95a81ca01e48ede9f39c799ecbcef817b8a3b2'`
  final String? sha;

  /// Id for the export details
  /// Example: `'latest'`
  final String? id;

  /// Url for fetching export details
  /// Example: `'https://api.github.com/user/codespaces/:name/exports/latest'`
  final String? exportUrl;

  /// Web url for the exported branch
  /// Example: `'https://github.com/octocat/hello-world/tree/:branch'`
  final String? htmlUrl;

  /// Converts a [CodespaceExportDetails] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'completed_at': completedAt?.toIso8601String(),
      'branch': branch,
      'sha': sha,
      if (id != null) 'id': id,
      if (exportUrl != null) 'export_url': exportUrl,
      'html_url': htmlUrl,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([state, completedAt, branch, sha, id, exportUrl, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespaceExportDetails &&
        state == other.state &&
        completedAt == other.completedAt &&
        branch == other.branch &&
        sha == other.sha &&
        id == other.id &&
        exportUrl == other.exportUrl &&
        htmlUrl == other.htmlUrl;
  }
}
