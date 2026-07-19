import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestReviewCommentLinksHtml {
  const PullRequestReviewCommentLinksHtml({required this.href});

  /// Converts a `Map<String, dynamic>` to a
  /// [PullRequestReviewCommentLinksHtml].
  factory PullRequestReviewCommentLinksHtml.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PullRequestReviewCommentLinksHtml',
      json,
      () => PullRequestReviewCommentLinksHtml(
        href: Uri.parse(json['href'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestReviewCommentLinksHtml? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewCommentLinksHtml.fromJson(json);
  }

  /// Example:
  /// `'https://github.com/octocat/Hello-World/pull/1#discussion-diff-1'`
  final Uri href;

  /// Converts a [PullRequestReviewCommentLinksHtml]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'href': href.toString()};
  }

  @override
  int get hashCode => href.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestReviewCommentLinksHtml && href == other.href;
  }
}
