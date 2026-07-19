// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_issue_comment}
/// Represents an 'issue_comment' secret scanning location type. This location
/// type shows that a secret was detected in a comment on an issue.
/// {@endtemplate}
@immutable
class SecretScanningLocationIssueComment {
  /// {@macro secret_scanning_location_issue_comment}
  const SecretScanningLocationIssueComment({required this.issueCommentUrl});

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningLocationIssueComment].
  factory SecretScanningLocationIssueComment.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningLocationIssueComment',
      json,
      () => SecretScanningLocationIssueComment(
        issueCommentUrl: Uri.parse(json['issue_comment_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationIssueComment? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationIssueComment.fromJson(json);
  }

  /// The API URL to get the issue comment where the secret was detected.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/issues/comments/1081119451'`
  final Uri issueCommentUrl;

  /// Converts a [SecretScanningLocationIssueComment]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'issue_comment_url': issueCommentUrl.toString()};
  }

  @override
  int get hashCode => issueCommentUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationIssueComment &&
        issueCommentUrl == other.issueCommentUrl;
  }
}
