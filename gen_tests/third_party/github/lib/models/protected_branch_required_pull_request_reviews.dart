// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/protected_branch_required_pull_request_reviews_bypass_pull_request_allowances.dart';
import 'package:github/models/protected_branch_required_pull_request_reviews_dismissal_restrictions.dart';
import 'package:meta/meta.dart';

@immutable
class ProtectedBranchRequiredPullRequestReviews {
  const ProtectedBranchRequiredPullRequestReviews({
    required this.url,
    this.dismissStaleReviews,
    this.requireCodeOwnerReviews,
    this.requiredApprovingReviewCount,
    this.requireLastPushApproval = false,
    this.dismissalRestrictions,
    this.bypassPullRequestAllowances,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ProtectedBranchRequiredPullRequestReviews].
  factory ProtectedBranchRequiredPullRequestReviews.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProtectedBranchRequiredPullRequestReviews',
      json,
      () => ProtectedBranchRequiredPullRequestReviews(
        url: Uri.parse(json['url'] as String),
        dismissStaleReviews: json['dismiss_stale_reviews'] as bool?,
        requireCodeOwnerReviews: json['require_code_owner_reviews'] as bool?,
        requiredApprovingReviewCount:
            json['required_approving_review_count'] as int?,
        requireLastPushApproval:
            (json['require_last_push_approval'] as bool?) ?? false,
        dismissalRestrictions:
            ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions.maybeFromJson(
              json['dismissal_restrictions'] as Map<String, dynamic>?,
            ),
        bypassPullRequestAllowances:
            ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances.maybeFromJson(
              json['bypass_pull_request_allowances'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchRequiredPullRequestReviews? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchRequiredPullRequestReviews.fromJson(json);
  }

  final Uri url;
  final bool? dismissStaleReviews;
  final bool? requireCodeOwnerReviews;
  final int? requiredApprovingReviewCount;

  /// Whether the most recent push must be approved by someone other than the
  /// person who pushed it.
  final bool requireLastPushApproval;
  final ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions?
  dismissalRestrictions;
  final ProtectedBranchRequiredPullRequestReviewsBypassPullRequestAllowances?
  bypassPullRequestAllowances;

  /// Converts a [ProtectedBranchRequiredPullRequestReviews]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      if (dismissStaleReviews != null)
        'dismiss_stale_reviews': dismissStaleReviews,
      if (requireCodeOwnerReviews != null)
        'require_code_owner_reviews': requireCodeOwnerReviews,
      if (requiredApprovingReviewCount != null)
        'required_approving_review_count': requiredApprovingReviewCount,
      'require_last_push_approval': requireLastPushApproval,
      if (dismissalRestrictions != null)
        'dismissal_restrictions': dismissalRestrictions?.toJson(),
      if (bypassPullRequestAllowances != null)
        'bypass_pull_request_allowances': bypassPullRequestAllowances?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    dismissStaleReviews,
    requireCodeOwnerReviews,
    requiredApprovingReviewCount,
    requireLastPushApproval,
    dismissalRestrictions,
    bypassPullRequestAllowances,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchRequiredPullRequestReviews &&
        url == other.url &&
        dismissStaleReviews == other.dismissStaleReviews &&
        requireCodeOwnerReviews == other.requireCodeOwnerReviews &&
        requiredApprovingReviewCount == other.requiredApprovingReviewCount &&
        requireLastPushApproval == other.requireLastPushApproval &&
        dismissalRestrictions == other.dismissalRestrictions &&
        bypassPullRequestAllowances == other.bypassPullRequestAllowances;
  }
}
