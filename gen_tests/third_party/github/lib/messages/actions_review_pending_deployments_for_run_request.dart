import 'package:github/model_helpers.dart';
import 'package:github/models/actions_review_pending_deployments_for_run_request_state.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsReviewPendingDeploymentsForRunRequest {
  const ActionsReviewPendingDeploymentsForRunRequest({
    required this.environmentIds,
    required this.state,
    required this.comment,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsReviewPendingDeploymentsForRunRequest].
  factory ActionsReviewPendingDeploymentsForRunRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsReviewPendingDeploymentsForRunRequest',
      json,
      () => ActionsReviewPendingDeploymentsForRunRequest(
        environmentIds: (json['environment_ids'] as List).cast<int>(),
        state: ActionsReviewPendingDeploymentsForRunRequestState.fromJson(
          json['state'] as String,
        ),
        comment: json['comment'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsReviewPendingDeploymentsForRunRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsReviewPendingDeploymentsForRunRequest.fromJson(json);
  }

  /// The list of environment ids to approve or reject
  /// Example: `161171787`
  /// Example: `161171795`
  final List<int> environmentIds;

  /// Whether to approve or reject deployment to the specified environments.
  /// Example: `'approved'`
  final ActionsReviewPendingDeploymentsForRunRequestState state;

  /// A comment to accompany the deployment review
  /// Example: `'Ship it!'`
  final String comment;

  /// Converts an [ActionsReviewPendingDeploymentsForRunRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'environment_ids': environmentIds,
      'state': state.toJson(),
      'comment': comment,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(environmentIds), state, comment]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsReviewPendingDeploymentsForRunRequest &&
        listsEqual(environmentIds, other.environmentIds) &&
        state == other.state &&
        comment == other.comment;
  }
}
