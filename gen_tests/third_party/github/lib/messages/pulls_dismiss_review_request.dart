import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsDismissReviewRequest {
  const PullsDismissReviewRequest({required this.message, this.event});

  /// Converts a `Map<String, dynamic>` to a [PullsDismissReviewRequest].
  factory PullsDismissReviewRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsDismissReviewRequest',
      json,
      () => PullsDismissReviewRequest(
        message: json['message'] as String,
        event: json['event'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsDismissReviewRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullsDismissReviewRequest.fromJson(json);
  }

  /// The single legal value of [event], exposed so it can be set explicitly.
  static const String eventValue = 'DISMISS';

  /// The message for the pull request review dismissal
  final String message;

  /// Example: `'"DISMISS"'`
  final String? event;

  /// Converts a [PullsDismissReviewRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'message': message, 'event': ?event};
  }

  @override
  int get hashCode => Object.hashAll([message, event]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsDismissReviewRequest &&
        message == other.message &&
        event == other.event;
  }
}
