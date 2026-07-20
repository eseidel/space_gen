// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_pull_request_parameters_allowed_merge_methods_inner.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRulePullRequestParameters {
  RepositoryRulePullRequestParameters({
    required this.dismissStaleReviewsOnPush,
    required this.requireCodeOwnerReview,
    required this.requireLastPushApproval,
    required this.requiredApprovingReviewCount,
    required this.requiredReviewThreadResolution,
    this.allowedMergeMethods,
    this.automaticCopilotCodeReviewEnabled,
  }) {
    requiredApprovingReviewCount.validate(min: 0, max: 10);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRulePullRequestParameters].
  factory RepositoryRulePullRequestParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRulePullRequestParameters',
      json,
      () => RepositoryRulePullRequestParameters(
        allowedMergeMethods: (json['allowed_merge_methods'] as List?)
            ?.map<RepositoryRulePullRequestParametersAllowedMergeMethodsInner>(
              (e) =>
                  RepositoryRulePullRequestParametersAllowedMergeMethodsInner.fromJson(
                    e as String,
                  ),
            )
            .toList(),
        automaticCopilotCodeReviewEnabled:
            json['automatic_copilot_code_review_enabled'] as bool?,
        dismissStaleReviewsOnPush:
            json['dismiss_stale_reviews_on_push'] as bool,
        requireCodeOwnerReview: json['require_code_owner_review'] as bool,
        requireLastPushApproval: json['require_last_push_approval'] as bool,
        requiredApprovingReviewCount:
            json['required_approving_review_count'] as int,
        requiredReviewThreadResolution:
            json['required_review_thread_resolution'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulePullRequestParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRulePullRequestParameters.fromJson(json);
  }

  /// Array of allowed merge methods. Allowed values include `merge`,
  /// `squash`, and `rebase`. At least one option must be enabled.
  final List<RepositoryRulePullRequestParametersAllowedMergeMethodsInner>?
  allowedMergeMethods;

  /// Automatically request review from Copilot for new pull requests, if the
  /// author has access to Copilot code review.
  final bool? automaticCopilotCodeReviewEnabled;

  /// New, reviewable commits pushed will dismiss previous pull request review
  /// approvals.
  final bool dismissStaleReviewsOnPush;

  /// Require an approving review in pull requests that modify files that have
  /// a designated code owner.
  final bool requireCodeOwnerReview;

  /// Whether the most recent reviewable push must be approved by someone
  /// other than the person who pushed it.
  final bool requireLastPushApproval;

  /// The number of approving reviews that are required before a pull request
  /// can be merged.
  final int requiredApprovingReviewCount;

  /// All conversations on code must be resolved before a pull request can be
  /// merged.
  final bool requiredReviewThreadResolution;

  /// Converts a [RepositoryRulePullRequestParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'allowed_merge_methods': ?allowedMergeMethods
          ?.map((e) => e.toJson())
          .toList(),
      'automatic_copilot_code_review_enabled':
          ?automaticCopilotCodeReviewEnabled,
      'dismiss_stale_reviews_on_push': dismissStaleReviewsOnPush,
      'require_code_owner_review': requireCodeOwnerReview,
      'require_last_push_approval': requireLastPushApproval,
      'required_approving_review_count': requiredApprovingReviewCount,
      'required_review_thread_resolution': requiredReviewThreadResolution,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(allowedMergeMethods),
    automaticCopilotCodeReviewEnabled,
    dismissStaleReviewsOnPush,
    requireCodeOwnerReview,
    requireLastPushApproval,
    requiredApprovingReviewCount,
    requiredReviewThreadResolution,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRulePullRequestParameters &&
        listsEqual(allowedMergeMethods, other.allowedMergeMethods) &&
        automaticCopilotCodeReviewEnabled ==
            other.automaticCopilotCodeReviewEnabled &&
        dismissStaleReviewsOnPush == other.dismissStaleReviewsOnPush &&
        requireCodeOwnerReview == other.requireCodeOwnerReview &&
        requireLastPushApproval == other.requireLastPushApproval &&
        requiredApprovingReviewCount == other.requiredApprovingReviewCount &&
        requiredReviewThreadResolution == other.requiredReviewThreadResolution;
  }
}
