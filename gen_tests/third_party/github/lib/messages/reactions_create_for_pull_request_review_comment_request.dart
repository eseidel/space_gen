import 'package:github/model_helpers.dart';
import 'package:github/models/reactions_create_for_pull_request_review_comment_request_content.dart';
import 'package:meta/meta.dart';

@immutable
class ReactionsCreateForPullRequestReviewCommentRequest {
  const ReactionsCreateForPullRequestReviewCommentRequest({
    required this.content,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReactionsCreateForPullRequestReviewCommentRequest].
  factory ReactionsCreateForPullRequestReviewCommentRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReactionsCreateForPullRequestReviewCommentRequest',
      json,
      () => ReactionsCreateForPullRequestReviewCommentRequest(
        content:
            ReactionsCreateForPullRequestReviewCommentRequestContent.fromJson(
              json['content'] as String,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReactionsCreateForPullRequestReviewCommentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReactionsCreateForPullRequestReviewCommentRequest.fromJson(json);
  }

  /// The [reaction
  /// type](https://docs.github.com/rest/reactions/reactions#about-reactions)
  /// to add to the pull request review comment.
  final ReactionsCreateForPullRequestReviewCommentRequestContent content;

  /// Converts a [ReactionsCreateForPullRequestReviewCommentRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'content': content.toJson()};
  }

  @override
  int get hashCode => content.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReactionsCreateForPullRequestReviewCommentRequest &&
        content == other.content;
  }
}
