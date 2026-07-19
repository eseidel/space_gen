import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_review_pat_grant_requests_in_bulk_request_action.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsReviewPatGrantRequestsInBulkRequest {
  const OrgsReviewPatGrantRequestsInBulkRequest({
    required this.action,
    this.patRequestIds,
    this.reason,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsReviewPatGrantRequestsInBulkRequest].
  factory OrgsReviewPatGrantRequestsInBulkRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsReviewPatGrantRequestsInBulkRequest',
      json,
      () => OrgsReviewPatGrantRequestsInBulkRequest(
        patRequestIds: (json['pat_request_ids'] as List?)?.cast<int>(),
        action: OrgsReviewPatGrantRequestsInBulkRequestAction.fromJson(
          json['action'] as String,
        ),
        reason: json['reason'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsReviewPatGrantRequestsInBulkRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsReviewPatGrantRequestsInBulkRequest.fromJson(json);
  }

  /// Unique identifiers of the requests for access via fine-grained personal
  /// access token. Must be formed of between 1 and 100 `pat_request_id`
  /// values.
  final List<int>? patRequestIds;

  /// Action to apply to the requests.
  final OrgsReviewPatGrantRequestsInBulkRequestAction action;

  /// Reason for approving or denying the requests. Max 1024 characters.
  final String? reason;

  /// Converts an [OrgsReviewPatGrantRequestsInBulkRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (patRequestIds != null) 'pat_request_ids': patRequestIds,
      'action': action.toJson(),
      'reason': reason,
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(patRequestIds), action, reason]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsReviewPatGrantRequestsInBulkRequest &&
        listsEqual(patRequestIds, other.patRequestIds) &&
        action == other.action &&
        reason == other.reason;
  }
}
