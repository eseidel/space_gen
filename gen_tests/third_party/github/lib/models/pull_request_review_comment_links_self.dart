import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestReviewCommentLinksSelf {
  const PullRequestReviewCommentLinksSelf({required this.href});

  /// Converts a `Map<String, dynamic>` to a
  /// [PullRequestReviewCommentLinksSelf].
  factory PullRequestReviewCommentLinksSelf.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PullRequestReviewCommentLinksSelf',
      json,
      () => PullRequestReviewCommentLinksSelf(
        href: Uri.parse(json['href'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestReviewCommentLinksSelf? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewCommentLinksSelf.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/pulls/comments/1'`
  final Uri href;

  /// Converts a [PullRequestReviewCommentLinksSelf]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'href': href.toString()};
  }

  @override
  int get hashCode => href.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestReviewCommentLinksSelf && href == other.href;
  }
}
