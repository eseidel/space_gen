// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsCreateReplyForReviewCommentRequest {
  const PullsCreateReplyForReviewCommentRequest({required this.body});

  /// Converts a `Map<String, dynamic>` to a
  /// [PullsCreateReplyForReviewCommentRequest].
  factory PullsCreateReplyForReviewCommentRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PullsCreateReplyForReviewCommentRequest',
      json,
      () =>
          PullsCreateReplyForReviewCommentRequest(body: json['body'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsCreateReplyForReviewCommentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullsCreateReplyForReviewCommentRequest.fromJson(json);
  }

  /// The text of the review comment.
  final String body;

  /// Converts a [PullsCreateReplyForReviewCommentRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body};
  }

  @override
  int get hashCode => body.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsCreateReplyForReviewCommentRequest &&
        body == other.body;
  }
}
