import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_review_pat_grant_request_request_action.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsReviewPatGrantRequestRequest {
  const OrgsReviewPatGrantRequestRequest({required this.action, this.reason});

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsReviewPatGrantRequestRequest].
  factory OrgsReviewPatGrantRequestRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsReviewPatGrantRequestRequest',
      json,
      () => OrgsReviewPatGrantRequestRequest(
        action: OrgsReviewPatGrantRequestRequestAction.fromJson(
          json['action'] as String,
        ),
        reason: json['reason'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsReviewPatGrantRequestRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsReviewPatGrantRequestRequest.fromJson(json);
  }

  /// Action to apply to the request.
  final OrgsReviewPatGrantRequestRequestAction action;

  /// Reason for approving or denying the request. Max 1024 characters.
  final String? reason;

  /// Converts an [OrgsReviewPatGrantRequestRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'action': action.toJson(), 'reason': reason};
  }

  @override
  int get hashCode => Object.hashAll([action, reason]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsReviewPatGrantRequestRequest &&
        action == other.action &&
        reason == other.reason;
  }
}
