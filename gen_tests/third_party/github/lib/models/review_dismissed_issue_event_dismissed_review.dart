import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReviewDismissedIssueEventDismissedReview {
  const ReviewDismissedIssueEventDismissedReview({
    required this.state,
    required this.reviewId,
    required this.dismissalMessage,
    this.dismissalCommitId,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReviewDismissedIssueEventDismissedReview].
  factory ReviewDismissedIssueEventDismissedReview.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReviewDismissedIssueEventDismissedReview',
      json,
      () => ReviewDismissedIssueEventDismissedReview(
        state: json['state'] as String,
        reviewId: json['review_id'] as int,
        dismissalMessage: checkedKey(json, 'dismissal_message') as String?,
        dismissalCommitId: json['dismissal_commit_id'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReviewDismissedIssueEventDismissedReview? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReviewDismissedIssueEventDismissedReview.fromJson(json);
  }

  final String state;
  final int reviewId;
  final String? dismissalMessage;
  final String? dismissalCommitId;

  /// Converts a [ReviewDismissedIssueEventDismissedReview]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'review_id': reviewId,
      'dismissal_message': dismissalMessage,
      'dismissal_commit_id': dismissalCommitId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([state, reviewId, dismissalMessage, dismissalCommitId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReviewDismissedIssueEventDismissedReview &&
        state == other.state &&
        reviewId == other.reviewId &&
        dismissalMessage == other.dismissalMessage &&
        dismissalCommitId == other.dismissalCommitId;
  }
}
