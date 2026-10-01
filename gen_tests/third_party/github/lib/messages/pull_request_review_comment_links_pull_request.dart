// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestReviewCommentLinksPullRequest {
  const PullRequestReviewCommentLinksPullRequest({required this.href});

  /// Converts a `Map<String, dynamic>` to a
  /// [PullRequestReviewCommentLinksPullRequest].
  factory PullRequestReviewCommentLinksPullRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PullRequestReviewCommentLinksPullRequest',
      json,
      () => PullRequestReviewCommentLinksPullRequest(
        href: Uri.parse(json['href'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestReviewCommentLinksPullRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewCommentLinksPullRequest.fromJson(json);
  }

  /// Example: `'https://api.github.com/repos/octocat/Hello-World/pulls/1'`
  final Uri href;

  /// Converts a [PullRequestReviewCommentLinksPullRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'href': href.toString()};
  }

  @override
  int get hashCode => href.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestReviewCommentLinksPullRequest &&
        href == other.href;
  }
}
