// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/pulls_create_review_request_comments_inner.dart';
import 'package:github/models/pulls_create_review_request_event.dart';
import 'package:meta/meta.dart';

@immutable
class PullsCreateReviewRequest {
  const PullsCreateReviewRequest({
    this.commitId,
    this.body,
    this.event,
    this.comments,
  });

  /// Converts a `Map<String, dynamic>` to a [PullsCreateReviewRequest].
  factory PullsCreateReviewRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsCreateReviewRequest',
      json,
      () => PullsCreateReviewRequest(
        commitId: json['commit_id'] as String?,
        body: json['body'] as String?,
        event: PullsCreateReviewRequestEvent.maybeFromJson(
          json['event'] as String?,
        ),
        comments: (json['comments'] as List?)
            ?.map<PullsCreateReviewRequestCommentsInner>(
              (e) => PullsCreateReviewRequestCommentsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsCreateReviewRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullsCreateReviewRequest.fromJson(json);
  }

  /// The SHA of the commit that needs a review. Not using the latest commit
  /// SHA may render your review comment outdated if a subsequent commit
  /// modifies the line you specify as the `position`. Defaults to the most
  /// recent commit in the pull request when you do not specify a value.
  final String? commitId;

  /// **Required** when using `REQUEST_CHANGES` or `COMMENT` for the `event`
  /// parameter. The body text of the pull request review.
  final String? body;

  /// The review action you want to perform. The review actions include:
  /// `APPROVE`, `REQUEST_CHANGES`, or `COMMENT`. By leaving this blank, you
  /// set the review action state to `PENDING`, which means you will need to
  /// [submit the pull request
  /// review](https://docs.github.com/rest/pulls/reviews#submit-a-review-for-a-pull-request)
  /// when you are ready.
  final PullsCreateReviewRequestEvent? event;

  /// Use the following table to specify the location, destination, and
  /// contents of the draft review comment.
  final List<PullsCreateReviewRequestCommentsInner>? comments;

  /// Converts a [PullsCreateReviewRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (commitId != null) 'commit_id': commitId,
      if (body != null) 'body': body,
      if (event != null) 'event': event?.toJson(),
      if (comments != null)
        'comments': comments?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([commitId, body, event, listHash(comments)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsCreateReviewRequest &&
        commitId == other.commitId &&
        body == other.body &&
        event == other.event &&
        listsEqual(comments, other.comments);
  }
}
