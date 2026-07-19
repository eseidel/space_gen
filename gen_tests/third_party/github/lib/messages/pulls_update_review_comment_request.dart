import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsUpdateReviewCommentRequest {
  const PullsUpdateReviewCommentRequest({required this.body});

  /// Converts a `Map<String, dynamic>` to a [PullsUpdateReviewCommentRequest].
  factory PullsUpdateReviewCommentRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsUpdateReviewCommentRequest',
      json,
      () => PullsUpdateReviewCommentRequest(body: json['body'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsUpdateReviewCommentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullsUpdateReviewCommentRequest.fromJson(json);
  }

  /// The text of the reply to the review comment.
  final String body;

  /// Converts a [PullsUpdateReviewCommentRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body};
  }

  @override
  int get hashCode => body.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsUpdateReviewCommentRequest && body == other.body;
  }
}
