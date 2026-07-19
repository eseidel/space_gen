import 'package:github/model_helpers.dart';
import 'package:github/models/pulls_submit_review_request_event.dart';
import 'package:meta/meta.dart';

@immutable
class PullsSubmitReviewRequest {
  const PullsSubmitReviewRequest({required this.event, this.body});

  /// Converts a `Map<String, dynamic>` to a [PullsSubmitReviewRequest].
  factory PullsSubmitReviewRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsSubmitReviewRequest',
      json,
      () => PullsSubmitReviewRequest(
        body: json['body'] as String?,
        event: PullsSubmitReviewRequestEvent.fromJson(json['event'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsSubmitReviewRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullsSubmitReviewRequest.fromJson(json);
  }

  /// The body text of the pull request review
  final String? body;

  /// The review action you want to perform. The review actions include:
  /// `APPROVE`, `REQUEST_CHANGES`, or `COMMENT`. When you leave this blank,
  /// the API returns _HTTP 422 (Unrecognizable entity)_ and sets the review
  /// action state to `PENDING`, which means you will need to re-submit the
  /// pull request review using a review action.
  final PullsSubmitReviewRequestEvent event;

  /// Converts a [PullsSubmitReviewRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body, 'event': event.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([body, event]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsSubmitReviewRequest &&
        body == other.body &&
        event == other.event;
  }
}
