import 'package:github/messages/pull_request_review_links_pull_request.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/pull_request_review_links_html.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestReviewLinks {
  const PullRequestReviewLinks({required this.html, required this.pullRequest});

  /// Converts a `Map<String, dynamic>` to a [PullRequestReviewLinks].
  factory PullRequestReviewLinks.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestReviewLinks',
      json,
      () => PullRequestReviewLinks(
        html: PullRequestReviewLinksHtml.fromJson(
          json['html'] as Map<String, dynamic>,
        ),
        pullRequest: PullRequestReviewLinksPullRequest.fromJson(
          json['pull_request'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestReviewLinks? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewLinks.fromJson(json);
  }

  final PullRequestReviewLinksHtml html;
  final PullRequestReviewLinksPullRequest pullRequest;

  /// Converts a [PullRequestReviewLinks] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'html': html.toJson(), 'pull_request': pullRequest.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([html, pullRequest]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestReviewLinks &&
        html == other.html &&
        pullRequest == other.pullRequest;
  }
}
