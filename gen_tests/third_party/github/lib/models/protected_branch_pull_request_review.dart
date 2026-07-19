// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/protected_branch_pull_request_review_bypass_pull_request_allowances.dart';
import 'package:github/models/protected_branch_pull_request_review_dismissal_restrictions.dart';
import 'package:meta/meta.dart';

/// {@template protected_branch_pull_request_review}
/// Protected Branch Pull Request Review
/// Protected Branch Pull Request Review
/// {@endtemplate}
@immutable
class ProtectedBranchPullRequestReview {
  /// {@macro protected_branch_pull_request_review}
  const ProtectedBranchPullRequestReview({
    required this.dismissStaleReviews,
    required this.requireCodeOwnerReviews,
    this.url,
    this.dismissalRestrictions,
    this.bypassPullRequestAllowances,
    this.requiredApprovingReviewCount,
    this.requireLastPushApproval = false,
  });

  /// Converts a `Map<String, dynamic>` to a [ProtectedBranchPullRequestReview].
  factory ProtectedBranchPullRequestReview.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProtectedBranchPullRequestReview',
      json,
      () => ProtectedBranchPullRequestReview(
        url: maybeParseUri(json['url'] as String?),
        dismissalRestrictions:
            ProtectedBranchPullRequestReviewDismissalRestrictions.maybeFromJson(
              json['dismissal_restrictions'] as Map<String, dynamic>?,
            ),
        bypassPullRequestAllowances:
            ProtectedBranchPullRequestReviewBypassPullRequestAllowances.maybeFromJson(
              json['bypass_pull_request_allowances'] as Map<String, dynamic>?,
            ),
        dismissStaleReviews: json['dismiss_stale_reviews'] as bool,
        requireCodeOwnerReviews: json['require_code_owner_reviews'] as bool,
        requiredApprovingReviewCount:
            json['required_approving_review_count'] as int?,
        requireLastPushApproval:
            (json['require_last_push_approval'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchPullRequestReview? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchPullRequestReview.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/branches/master/protection/dismissal_restrictions'`
  final Uri? url;
  final ProtectedBranchPullRequestReviewDismissalRestrictions?
  dismissalRestrictions;

  /// Allow specific users, teams, or apps to bypass pull request
  /// requirements.
  final ProtectedBranchPullRequestReviewBypassPullRequestAllowances?
  bypassPullRequestAllowances;

  /// Example: `true`
  final bool dismissStaleReviews;

  /// Example: `true`
  final bool requireCodeOwnerReviews;

  /// Example: `2`
  final int? requiredApprovingReviewCount;

  /// Whether the most recent push must be approved by someone other than the
  /// person who pushed it.
  /// Example: `true`
  final bool requireLastPushApproval;

  /// Converts a [ProtectedBranchPullRequestReview] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': ?url?.toString(),
      'dismissal_restrictions': ?dismissalRestrictions?.toJson(),
      'bypass_pull_request_allowances': ?bypassPullRequestAllowances?.toJson(),
      'dismiss_stale_reviews': dismissStaleReviews,
      'require_code_owner_reviews': requireCodeOwnerReviews,
      'required_approving_review_count': ?requiredApprovingReviewCount,
      'require_last_push_approval': requireLastPushApproval,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    dismissalRestrictions,
    bypassPullRequestAllowances,
    dismissStaleReviews,
    requireCodeOwnerReviews,
    requiredApprovingReviewCount,
    requireLastPushApproval,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchPullRequestReview &&
        url == other.url &&
        dismissalRestrictions == other.dismissalRestrictions &&
        bypassPullRequestAllowances == other.bypassPullRequestAllowances &&
        dismissStaleReviews == other.dismissStaleReviews &&
        requireCodeOwnerReviews == other.requireCodeOwnerReviews &&
        requiredApprovingReviewCount == other.requiredApprovingReviewCount &&
        requireLastPushApproval == other.requireLastPushApproval;
  }
}
