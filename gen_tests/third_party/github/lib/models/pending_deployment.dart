import 'package:github/model_helpers.dart';
import 'package:github/models/pending_deployment_environment.dart';
import 'package:github/models/pending_deployment_reviewers_inner.dart';
import 'package:meta/meta.dart';

/// {@template pending_deployment}
/// Pending Deployment
/// Details of a deployment that is waiting for protection rules to pass
/// {@endtemplate}
@immutable
class PendingDeployment {
  /// {@macro pending_deployment}
  const PendingDeployment({
    required this.environment,
    required this.waitTimer,
    required this.waitTimerStartedAt,
    required this.currentUserCanApprove,
    required this.reviewers,
  });

  /// Converts a `Map<String, dynamic>` to a [PendingDeployment].
  factory PendingDeployment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PendingDeployment',
      json,
      () => PendingDeployment(
        environment: PendingDeploymentEnvironment.fromJson(
          json['environment'] as Map<String, dynamic>,
        ),
        waitTimer: json['wait_timer'] as int,
        waitTimerStartedAt: maybeParseDateTime(
          checkedKey(json, 'wait_timer_started_at') as String?,
        ),
        currentUserCanApprove: json['current_user_can_approve'] as bool,
        reviewers: (json['reviewers'] as List)
            .map<PendingDeploymentReviewersInner>(
              (e) => PendingDeploymentReviewersInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PendingDeployment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PendingDeployment.fromJson(json);
  }

  final PendingDeploymentEnvironment environment;

  /// The set duration of the wait timer
  /// Example: `30`
  final int waitTimer;

  /// The time that the wait timer began.
  /// Example: `'2020-11-23T22:00:40Z'`
  final DateTime? waitTimerStartedAt;

  /// Whether the currently authenticated user can approve the deployment
  /// Example: `true`
  final bool currentUserCanApprove;

  /// The people or teams that may approve jobs that reference the
  /// environment. You can list up to six users or teams as reviewers. The
  /// reviewers must have at least read access to the repository. Only one of
  /// the required reviewers needs to approve the job for it to proceed.
  final List<PendingDeploymentReviewersInner> reviewers;

  /// Converts a [PendingDeployment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'environment': environment.toJson(),
      'wait_timer': waitTimer,
      'wait_timer_started_at': waitTimerStartedAt?.toIso8601String(),
      'current_user_can_approve': currentUserCanApprove,
      'reviewers': reviewers.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    environment,
    waitTimer,
    waitTimerStartedAt,
    currentUserCanApprove,
    listHash(reviewers),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PendingDeployment &&
        environment == other.environment &&
        waitTimer == other.waitTimer &&
        waitTimerStartedAt == other.waitTimerStartedAt &&
        currentUserCanApprove == other.currentUserCanApprove &&
        listsEqual(reviewers, other.reviewers);
  }
}
