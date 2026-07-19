import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsUpdateReviewRequest {
  const PullsUpdateReviewRequest({required this.body});

  /// Converts a `Map<String, dynamic>` to a [PullsUpdateReviewRequest].
  factory PullsUpdateReviewRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsUpdateReviewRequest',
      json,
      () => PullsUpdateReviewRequest(body: json['body'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsUpdateReviewRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullsUpdateReviewRequest.fromJson(json);
  }

  /// The body text of the pull request review.
  final String body;

  /// Converts a [PullsUpdateReviewRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body};
  }

  @override
  int get hashCode => body.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsUpdateReviewRequest && body == other.body;
  }
}
