// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repos_update_pull_request_review_protection_request_bypass_pull_request_allowances.dart';
import 'package:github/models/repos_update_pull_request_review_protection_request_dismissal_restrictions.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdatePullRequestReviewProtectionRequest {
  const ReposUpdatePullRequestReviewProtectionRequest({
    this.dismissalRestrictions,
    this.dismissStaleReviews,
    this.requireCodeOwnerReviews,
    this.requiredApprovingReviewCount,
    this.requireLastPushApproval = false,
    this.bypassPullRequestAllowances,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdatePullRequestReviewProtectionRequest].
  factory ReposUpdatePullRequestReviewProtectionRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdatePullRequestReviewProtectionRequest',
      json,
      () => ReposUpdatePullRequestReviewProtectionRequest(
        dismissalRestrictions:
            ReposUpdatePullRequestReviewProtectionRequestDismissalRestrictions.maybeFromJson(
              json['dismissal_restrictions'] as Map<String, dynamic>?,
            ),
        dismissStaleReviews: json['dismiss_stale_reviews'] as bool?,
        requireCodeOwnerReviews: json['require_code_owner_reviews'] as bool?,
        requiredApprovingReviewCount:
            json['required_approving_review_count'] as int?,
        requireLastPushApproval:
            (json['require_last_push_approval'] as bool?) ?? false,
        bypassPullRequestAllowances:
            ReposUpdatePullRequestReviewProtectionRequestBypassPullRequestAllowances.maybeFromJson(
              json['bypass_pull_request_allowances'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdatePullRequestReviewProtectionRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdatePullRequestReviewProtectionRequest.fromJson(json);
  }

  /// Specify which users, teams, and apps can dismiss pull request reviews.
  /// Pass an empty `dismissal_restrictions` object to disable. User and team
  /// `dismissal_restrictions` are only available for organization-owned
  /// repositories. Omit this parameter for personal repositories.
  final ReposUpdatePullRequestReviewProtectionRequestDismissalRestrictions?
  dismissalRestrictions;

  /// Set to `true` if you want to automatically dismiss approving reviews
  /// when someone pushes a new commit.
  final bool? dismissStaleReviews;

  /// Blocks merging pull requests until [code
  /// owners](https://docs.github.com/articles/about-code-owners/) have
  /// reviewed.
  final bool? requireCodeOwnerReviews;

  /// Specifies the number of reviewers required to approve pull requests. Use
  /// a number between 1 and 6 or 0 to not require reviewers.
  final int? requiredApprovingReviewCount;

  /// Whether the most recent push must be approved by someone other than the
  /// person who pushed it. Default: `false`
  final bool? requireLastPushApproval;

  /// Allow specific users, teams, or apps to bypass pull request
  /// requirements.
  final ReposUpdatePullRequestReviewProtectionRequestBypassPullRequestAllowances?
  bypassPullRequestAllowances;

  /// Converts a [ReposUpdatePullRequestReviewProtectionRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'dismissal_restrictions': dismissalRestrictions?.toJson(),
      'dismiss_stale_reviews': dismissStaleReviews,
      'require_code_owner_reviews': requireCodeOwnerReviews,
      'required_approving_review_count': requiredApprovingReviewCount,
      'require_last_push_approval': requireLastPushApproval,
      'bypass_pull_request_allowances': bypassPullRequestAllowances?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    dismissalRestrictions,
    dismissStaleReviews,
    requireCodeOwnerReviews,
    requiredApprovingReviewCount,
    requireLastPushApproval,
    bypassPullRequestAllowances,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdatePullRequestReviewProtectionRequest &&
        dismissalRestrictions == other.dismissalRestrictions &&
        dismissStaleReviews == other.dismissStaleReviews &&
        requireCodeOwnerReviews == other.requireCodeOwnerReviews &&
        requiredApprovingReviewCount == other.requiredApprovingReviewCount &&
        requireLastPushApproval == other.requireLastPushApproval &&
        bypassPullRequestAllowances == other.bypassPullRequestAllowances;
  }
}
