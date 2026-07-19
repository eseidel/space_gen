import 'package:github/messages/pull_request_review_comment_links_pull_request.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/pull_request_review_comment_links_html.dart';
import 'package:github/models/pull_request_review_comment_links_self.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestReviewCommentLinks {
  const PullRequestReviewCommentLinks({
    required this.self,
    required this.html,
    required this.pullRequest,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestReviewCommentLinks].
  factory PullRequestReviewCommentLinks.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestReviewCommentLinks',
      json,
      () => PullRequestReviewCommentLinks(
        self: PullRequestReviewCommentLinksSelf.fromJson(
          json['self'] as Map<String, dynamic>,
        ),
        html: PullRequestReviewCommentLinksHtml.fromJson(
          json['html'] as Map<String, dynamic>,
        ),
        pullRequest: PullRequestReviewCommentLinksPullRequest.fromJson(
          json['pull_request'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestReviewCommentLinks? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewCommentLinks.fromJson(json);
  }

  final PullRequestReviewCommentLinksSelf self;
  final PullRequestReviewCommentLinksHtml html;
  final PullRequestReviewCommentLinksPullRequest pullRequest;

  /// Converts a [PullRequestReviewCommentLinks] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'self': self.toJson(),
      'html': html.toJson(),
      'pull_request': pullRequest.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([self, html, pullRequest]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestReviewCommentLinks &&
        self == other.self &&
        html == other.html &&
        pullRequest == other.pullRequest;
  }
}
