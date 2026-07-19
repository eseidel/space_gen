import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_pull_request_review_comment}
/// Represents a 'pull_request_review_comment' secret scanning location type.
/// This location type shows that a secret was detected in a review comment on a
/// pull request.
/// {@endtemplate}
@immutable
class SecretScanningLocationPullRequestReviewComment {
  /// {@macro secret_scanning_location_pull_request_review_comment}
  const SecretScanningLocationPullRequestReviewComment({
    required this.pullRequestReviewCommentUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningLocationPullRequestReviewComment].
  factory SecretScanningLocationPullRequestReviewComment.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningLocationPullRequestReviewComment',
      json,
      () => SecretScanningLocationPullRequestReviewComment(
        pullRequestReviewCommentUrl: Uri.parse(
          json['pull_request_review_comment_url'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationPullRequestReviewComment? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationPullRequestReviewComment.fromJson(json);
  }

  /// The API URL to get the pull request review comment where the secret was
  /// detected.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/pulls/comments/12'`
  final Uri pullRequestReviewCommentUrl;

  /// Converts a [SecretScanningLocationPullRequestReviewComment]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'pull_request_review_comment_url': pullRequestReviewCommentUrl.toString(),
    };
  }

  @override
  int get hashCode => pullRequestReviewCommentUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationPullRequestReviewComment &&
        pullRequestReviewCommentUrl == other.pullRequestReviewCommentUrl;
  }
}
