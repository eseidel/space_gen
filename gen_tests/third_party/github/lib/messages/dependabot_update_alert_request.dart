import 'package:github/model_helpers.dart';
import 'package:github/models/dependabot_update_alert_request_dismissed_reason.dart';
import 'package:github/models/dependabot_update_alert_request_state.dart';
import 'package:meta/meta.dart';

@immutable
class DependabotUpdateAlertRequest {
  const DependabotUpdateAlertRequest({
    required this.state,
    this.dismissedReason,
    this.dismissedComment,
  });

  /// Converts a `Map<String, dynamic>` to a [DependabotUpdateAlertRequest].
  factory DependabotUpdateAlertRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DependabotUpdateAlertRequest',
      json,
      () => DependabotUpdateAlertRequest(
        state: DependabotUpdateAlertRequestState.fromJson(
          json['state'] as String,
        ),
        dismissedReason:
            DependabotUpdateAlertRequestDismissedReason.maybeFromJson(
              json['dismissed_reason'] as String?,
            ),
        dismissedComment: json['dismissed_comment'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotUpdateAlertRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotUpdateAlertRequest.fromJson(json);
  }

  /// The state of the Dependabot alert.
  /// A `dismissed_reason` must be provided when setting the state to
  /// `dismissed`.
  final DependabotUpdateAlertRequestState state;

  /// **Required when `state` is `dismissed`.** A reason for dismissing the
  /// alert.
  final DependabotUpdateAlertRequestDismissedReason? dismissedReason;

  /// An optional comment associated with dismissing the alert.
  final String? dismissedComment;

  /// Converts a [DependabotUpdateAlertRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'state': state.toJson(),
      if (dismissedReason != null)
        'dismissed_reason': dismissedReason?.toJson(),
      if (dismissedComment != null) 'dismissed_comment': dismissedComment,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([state, dismissedReason, dismissedComment]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotUpdateAlertRequest &&
        state == other.state &&
        dismissedReason == other.dismissedReason &&
        dismissedComment == other.dismissedComment;
  }
}
