// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/branch_protection_allow_deletions.dart';
import 'package:github/models/branch_protection_allow_force_pushes.dart';
import 'package:github/models/branch_protection_allow_fork_syncing.dart';
import 'package:github/models/branch_protection_block_creations.dart';
import 'package:github/models/branch_protection_lock_branch.dart';
import 'package:github/models/branch_protection_required_conversation_resolution.dart';
import 'package:github/models/branch_protection_required_linear_history.dart';
import 'package:github/models/branch_protection_required_signatures.dart';
import 'package:github/models/branch_restriction_policy.dart';
import 'package:github/models/protected_branch_admin_enforced.dart';
import 'package:github/models/protected_branch_pull_request_review.dart';
import 'package:github/models/protected_branch_required_status_check.dart';
import 'package:meta/meta.dart';

/// {@template branch_protection}
/// Branch Protection
/// Branch Protection
/// {@endtemplate}
@immutable
class BranchProtection {
  /// {@macro branch_protection}
  const BranchProtection({
    this.url,
    this.enabled,
    this.requiredStatusChecks,
    this.enforceAdmins,
    this.requiredPullRequestReviews,
    this.restrictions,
    this.requiredLinearHistory,
    this.allowForcePushes,
    this.allowDeletions,
    this.blockCreations,
    this.requiredConversationResolution,
    this.name,
    this.protectionUrl,
    this.requiredSignatures,
    this.lockBranch,
    this.allowForkSyncing,
  });

  /// Converts a `Map<String, dynamic>` to a [BranchProtection].
  factory BranchProtection.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BranchProtection',
      json,
      () => BranchProtection(
        url: json['url'] as String?,
        enabled: json['enabled'] as bool?,
        requiredStatusChecks: ProtectedBranchRequiredStatusCheck.maybeFromJson(
          json['required_status_checks'] as Map<String, dynamic>?,
        ),
        enforceAdmins: ProtectedBranchAdminEnforced.maybeFromJson(
          json['enforce_admins'] as Map<String, dynamic>?,
        ),
        requiredPullRequestReviews:
            ProtectedBranchPullRequestReview.maybeFromJson(
              json['required_pull_request_reviews'] as Map<String, dynamic>?,
            ),
        restrictions: BranchRestrictionPolicy.maybeFromJson(
          json['restrictions'] as Map<String, dynamic>?,
        ),
        requiredLinearHistory:
            BranchProtectionRequiredLinearHistory.maybeFromJson(
              json['required_linear_history'] as Map<String, dynamic>?,
            ),
        allowForcePushes: BranchProtectionAllowForcePushes.maybeFromJson(
          json['allow_force_pushes'] as Map<String, dynamic>?,
        ),
        allowDeletions: BranchProtectionAllowDeletions.maybeFromJson(
          json['allow_deletions'] as Map<String, dynamic>?,
        ),
        blockCreations: BranchProtectionBlockCreations.maybeFromJson(
          json['block_creations'] as Map<String, dynamic>?,
        ),
        requiredConversationResolution:
            BranchProtectionRequiredConversationResolution.maybeFromJson(
              json['required_conversation_resolution'] as Map<String, dynamic>?,
            ),
        name: json['name'] as String?,
        protectionUrl: json['protection_url'] as String?,
        requiredSignatures: BranchProtectionRequiredSignatures.maybeFromJson(
          json['required_signatures'] as Map<String, dynamic>?,
        ),
        lockBranch: BranchProtectionLockBranch.maybeFromJson(
          json['lock_branch'] as Map<String, dynamic>?,
        ),
        allowForkSyncing: BranchProtectionAllowForkSyncing.maybeFromJson(
          json['allow_fork_syncing'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchProtection? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BranchProtection.fromJson(json);
  }

  final String? url;
  final bool? enabled;

  /// Protected Branch Required Status Check
  /// Protected Branch Required Status Check
  final ProtectedBranchRequiredStatusCheck? requiredStatusChecks;

  /// Protected Branch Admin Enforced
  /// Protected Branch Admin Enforced
  final ProtectedBranchAdminEnforced? enforceAdmins;

  /// Protected Branch Pull Request Review
  /// Protected Branch Pull Request Review
  final ProtectedBranchPullRequestReview? requiredPullRequestReviews;

  /// Branch Restriction Policy
  /// Branch Restriction Policy
  final BranchRestrictionPolicy? restrictions;
  final BranchProtectionRequiredLinearHistory? requiredLinearHistory;
  final BranchProtectionAllowForcePushes? allowForcePushes;
  final BranchProtectionAllowDeletions? allowDeletions;
  final BranchProtectionBlockCreations? blockCreations;
  final BranchProtectionRequiredConversationResolution?
  requiredConversationResolution;

  /// Example: `'"branch/with/protection"'`
  final String? name;

  /// Example:
  /// `'"https://api.github.com/repos/owner-79e94e2d36b3fd06a32bb213/AAA_Public_Repo/branches/branch/with/protection/protection"'`
  final String? protectionUrl;
  final BranchProtectionRequiredSignatures? requiredSignatures;

  /// Whether to set the branch as read-only. If this is true, users will not
  /// be able to push to the branch.
  final BranchProtectionLockBranch? lockBranch;

  /// Whether users can pull changes from upstream when the branch is locked.
  /// Set to `true` to allow fork syncing. Set to `false` to prevent fork
  /// syncing.
  final BranchProtectionAllowForkSyncing? allowForkSyncing;

  /// Converts a [BranchProtection] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (url != null) 'url': url,
      if (enabled != null) 'enabled': enabled,
      if (requiredStatusChecks != null)
        'required_status_checks': requiredStatusChecks?.toJson(),
      if (enforceAdmins != null) 'enforce_admins': enforceAdmins?.toJson(),
      if (requiredPullRequestReviews != null)
        'required_pull_request_reviews': requiredPullRequestReviews?.toJson(),
      if (restrictions != null) 'restrictions': restrictions?.toJson(),
      if (requiredLinearHistory != null)
        'required_linear_history': requiredLinearHistory?.toJson(),
      if (allowForcePushes != null)
        'allow_force_pushes': allowForcePushes?.toJson(),
      if (allowDeletions != null) 'allow_deletions': allowDeletions?.toJson(),
      if (blockCreations != null) 'block_creations': blockCreations?.toJson(),
      if (requiredConversationResolution != null)
        'required_conversation_resolution': requiredConversationResolution
            ?.toJson(),
      if (name != null) 'name': name,
      if (protectionUrl != null) 'protection_url': protectionUrl,
      if (requiredSignatures != null)
        'required_signatures': requiredSignatures?.toJson(),
      if (lockBranch != null) 'lock_branch': lockBranch?.toJson(),
      if (allowForkSyncing != null)
        'allow_fork_syncing': allowForkSyncing?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    enabled,
    requiredStatusChecks,
    enforceAdmins,
    requiredPullRequestReviews,
    restrictions,
    requiredLinearHistory,
    allowForcePushes,
    allowDeletions,
    blockCreations,
    requiredConversationResolution,
    name,
    protectionUrl,
    requiredSignatures,
    lockBranch,
    allowForkSyncing,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchProtection &&
        url == other.url &&
        enabled == other.enabled &&
        requiredStatusChecks == other.requiredStatusChecks &&
        enforceAdmins == other.enforceAdmins &&
        requiredPullRequestReviews == other.requiredPullRequestReviews &&
        restrictions == other.restrictions &&
        requiredLinearHistory == other.requiredLinearHistory &&
        allowForcePushes == other.allowForcePushes &&
        allowDeletions == other.allowDeletions &&
        blockCreations == other.blockCreations &&
        requiredConversationResolution ==
            other.requiredConversationResolution &&
        name == other.name &&
        protectionUrl == other.protectionUrl &&
        requiredSignatures == other.requiredSignatures &&
        lockBranch == other.lockBranch &&
        allowForkSyncing == other.allowForkSyncing;
  }
}
