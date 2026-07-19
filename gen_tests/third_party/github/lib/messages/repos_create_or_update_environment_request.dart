import 'package:github/model_helpers.dart';
import 'package:github/models/deployment_branch_policy_settings.dart';
import 'package:github/models/prevent_self_review.dart';
import 'package:github/models/repos_create_or_update_environment_request_reviewers_inner.dart';
import 'package:github/models/wait_timer.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateOrUpdateEnvironmentRequest {
  const ReposCreateOrUpdateEnvironmentRequest({
    this.waitTimer,
    this.preventSelfReview,
    this.reviewers,
    this.deploymentBranchPolicy,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreateOrUpdateEnvironmentRequest].
  factory ReposCreateOrUpdateEnvironmentRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreateOrUpdateEnvironmentRequest',
      json,
      () => ReposCreateOrUpdateEnvironmentRequest(
        waitTimer: WaitTimer.maybeFromJson(json['wait_timer'] as int?),
        preventSelfReview: PreventSelfReview.maybeFromJson(
          json['prevent_self_review'] as bool?,
        ),
        reviewers: (json['reviewers'] as List?)
            ?.map<ReposCreateOrUpdateEnvironmentRequestReviewersInner>(
              (e) =>
                  ReposCreateOrUpdateEnvironmentRequestReviewersInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
        deploymentBranchPolicy: DeploymentBranchPolicySettings.maybeFromJson(
          json['deployment_branch_policy'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateOrUpdateEnvironmentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateOrUpdateEnvironmentRequest.fromJson(json);
  }

  /// The amount of time to delay a job after the job is initially triggered.
  /// The time (in minutes) must be an integer between 0 and 43,200 (30 days).
  /// Example: `30`
  final WaitTimer? waitTimer;

  /// Whether or not a user who created the job is prevented from approving
  /// their own job.
  /// Example: `false`
  final PreventSelfReview? preventSelfReview;

  /// The people or teams that may review jobs that reference the environment.
  /// You can list up to six users or teams as reviewers. The reviewers must
  /// have at least read access to the repository. Only one of the required
  /// reviewers needs to approve the job for it to proceed.
  final List<ReposCreateOrUpdateEnvironmentRequestReviewersInner>? reviewers;

  /// The type of deployment branch policy for this environment. To allow all
  /// branches to deploy, set to `null`.
  final DeploymentBranchPolicySettings? deploymentBranchPolicy;

  /// Converts a [ReposCreateOrUpdateEnvironmentRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'wait_timer': ?waitTimer?.toJson(),
      'prevent_self_review': ?preventSelfReview?.toJson(),
      'reviewers': reviewers?.map((e) => e.toJson()).toList(),
      'deployment_branch_policy': deploymentBranchPolicy?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    waitTimer,
    preventSelfReview,
    listHash(reviewers),
    deploymentBranchPolicy,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateOrUpdateEnvironmentRequest &&
        waitTimer == other.waitTimer &&
        preventSelfReview == other.preventSelfReview &&
        listsEqual(reviewers, other.reviewers) &&
        deploymentBranchPolicy == other.deploymentBranchPolicy;
  }
}
