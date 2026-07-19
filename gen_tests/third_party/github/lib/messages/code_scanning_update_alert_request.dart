import 'package:github/messages/code_scanning_alert_create_request.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_alert_dismissed_comment.dart';
import 'package:github/models/code_scanning_alert_dismissed_reason.dart';
import 'package:github/models/code_scanning_alert_set_state.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningUpdateAlertRequest {
  const CodeScanningUpdateAlertRequest({
    required this.state,
    this.dismissedReason,
    this.dismissedComment,
    this.createRequest,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningUpdateAlertRequest].
  factory CodeScanningUpdateAlertRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningUpdateAlertRequest',
      json,
      () => CodeScanningUpdateAlertRequest(
        state: CodeScanningAlertSetState.fromJson(json['state'] as String),
        dismissedReason: CodeScanningAlertDismissedReason.maybeFromJson(
          json['dismissed_reason'] as String?,
        ),
        dismissedComment: CodeScanningAlertDismissedComment.maybeFromJson(
          json['dismissed_comment'] as String?,
        ),
        createRequest: CodeScanningAlertCreateRequest.maybeFromJson(
          json['create_request'] as bool?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningUpdateAlertRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningUpdateAlertRequest.fromJson(json);
  }

  /// Sets the state of the code scanning alert. You must provide
  /// `dismissed_reason` when you set the state to `dismissed`.
  final CodeScanningAlertSetState state;

  /// **Required when the state is dismissed.** The reason for dismissing or
  /// closing the alert.
  final CodeScanningAlertDismissedReason? dismissedReason;

  /// The dismissal comment associated with the dismissal of the alert.
  final CodeScanningAlertDismissedComment? dismissedComment;

  /// If `true`, attempt to create an alert dismissal request.
  final CodeScanningAlertCreateRequest? createRequest;

  /// Converts a [CodeScanningUpdateAlertRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'state': state.toJson(),
      'dismissed_reason': dismissedReason?.toJson(),
      'dismissed_comment': dismissedComment?.toJson(),
      'create_request': ?createRequest?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([state, dismissedReason, dismissedComment, createRequest]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningUpdateAlertRequest &&
        state == other.state &&
        dismissedReason == other.dismissedReason &&
        dismissedComment == other.dismissedComment &&
        createRequest == other.createRequest;
  }
}
