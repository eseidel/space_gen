import 'package:github/model_helpers.dart';
import 'package:github/models/branch_restriction_policy.dart';
import 'package:github/models/protected_branch_allow_deletions.dart';
import 'package:github/models/protected_branch_allow_force_pushes.dart';
import 'package:github/models/protected_branch_allow_fork_syncing.dart';
import 'package:github/models/protected_branch_block_creations.dart';
import 'package:github/models/protected_branch_enforce_admins.dart';
import 'package:github/models/protected_branch_lock_branch.dart';
import 'package:github/models/protected_branch_required_conversation_resolution.dart';
import 'package:github/models/protected_branch_required_linear_history.dart';
import 'package:github/models/protected_branch_required_pull_request_reviews.dart';
import 'package:github/models/protected_branch_required_signatures.dart';
import 'package:github/models/status_check_policy.dart';
import 'package:meta/meta.dart';

/// {@template protected_branch}
/// Protected Branch
/// Branch protections protect branches
/// {@endtemplate}
@immutable
class ProtectedBranch {
  /// {@macro protected_branch}
  const ProtectedBranch({
    required this.url,
    this.requiredStatusChecks,
    this.requiredPullRequestReviews,
    this.requiredSignatures,
    this.enforceAdmins,
    this.requiredLinearHistory,
    this.allowForcePushes,
    this.allowDeletions,
    this.restrictions,
    this.requiredConversationResolution,
    this.blockCreations,
    this.lockBranch,
    this.allowForkSyncing,
  });

  /// Converts a `Map<String, dynamic>` to a [ProtectedBranch].
  factory ProtectedBranch.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProtectedBranch',
      json,
      () => ProtectedBranch(
        url: Uri.parse(json['url'] as String),
        requiredStatusChecks: StatusCheckPolicy.maybeFromJson(
          json['required_status_checks'] as Map<String, dynamic>?,
        ),
        requiredPullRequestReviews:
            ProtectedBranchRequiredPullRequestReviews.maybeFromJson(
              json['required_pull_request_reviews'] as Map<String, dynamic>?,
            ),
        requiredSignatures: ProtectedBranchRequiredSignatures.maybeFromJson(
          json['required_signatures'] as Map<String, dynamic>?,
        ),
        enforceAdmins: ProtectedBranchEnforceAdmins.maybeFromJson(
          json['enforce_admins'] as Map<String, dynamic>?,
        ),
        requiredLinearHistory:
            ProtectedBranchRequiredLinearHistory.maybeFromJson(
              json['required_linear_history'] as Map<String, dynamic>?,
            ),
        allowForcePushes: ProtectedBranchAllowForcePushes.maybeFromJson(
          json['allow_force_pushes'] as Map<String, dynamic>?,
        ),
        allowDeletions: ProtectedBranchAllowDeletions.maybeFromJson(
          json['allow_deletions'] as Map<String, dynamic>?,
        ),
        restrictions: BranchRestrictionPolicy.maybeFromJson(
          json['restrictions'] as Map<String, dynamic>?,
        ),
        requiredConversationResolution:
            ProtectedBranchRequiredConversationResolution.maybeFromJson(
              json['required_conversation_resolution'] as Map<String, dynamic>?,
            ),
        blockCreations: ProtectedBranchBlockCreations.maybeFromJson(
          json['block_creations'] as Map<String, dynamic>?,
        ),
        lockBranch: ProtectedBranchLockBranch.maybeFromJson(
          json['lock_branch'] as Map<String, dynamic>?,
        ),
        allowForkSyncing: ProtectedBranchAllowForkSyncing.maybeFromJson(
          json['allow_fork_syncing'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranch? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProtectedBranch.fromJson(json);
  }

  final Uri url;

  /// Status Check Policy
  /// Status Check Policy
  final StatusCheckPolicy? requiredStatusChecks;
  final ProtectedBranchRequiredPullRequestReviews? requiredPullRequestReviews;
  final ProtectedBranchRequiredSignatures? requiredSignatures;
  final ProtectedBranchEnforceAdmins? enforceAdmins;
  final ProtectedBranchRequiredLinearHistory? requiredLinearHistory;
  final ProtectedBranchAllowForcePushes? allowForcePushes;
  final ProtectedBranchAllowDeletions? allowDeletions;

  /// Branch Restriction Policy
  /// Branch Restriction Policy
  final BranchRestrictionPolicy? restrictions;
  final ProtectedBranchRequiredConversationResolution?
  requiredConversationResolution;
  final ProtectedBranchBlockCreations? blockCreations;

  /// Whether to set the branch as read-only. If this is true, users will not
  /// be able to push to the branch.
  final ProtectedBranchLockBranch? lockBranch;

  /// Whether users can pull changes from upstream when the branch is locked.
  /// Set to `true` to allow fork syncing. Set to `false` to prevent fork
  /// syncing.
  final ProtectedBranchAllowForkSyncing? allowForkSyncing;

  /// Converts a [ProtectedBranch] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      if (requiredStatusChecks != null)
        'required_status_checks': requiredStatusChecks?.toJson(),
      if (requiredPullRequestReviews != null)
        'required_pull_request_reviews': requiredPullRequestReviews?.toJson(),
      if (requiredSignatures != null)
        'required_signatures': requiredSignatures?.toJson(),
      if (enforceAdmins != null) 'enforce_admins': enforceAdmins?.toJson(),
      if (requiredLinearHistory != null)
        'required_linear_history': requiredLinearHistory?.toJson(),
      if (allowForcePushes != null)
        'allow_force_pushes': allowForcePushes?.toJson(),
      if (allowDeletions != null) 'allow_deletions': allowDeletions?.toJson(),
      if (restrictions != null) 'restrictions': restrictions?.toJson(),
      if (requiredConversationResolution != null)
        'required_conversation_resolution': requiredConversationResolution
            ?.toJson(),
      if (blockCreations != null) 'block_creations': blockCreations?.toJson(),
      if (lockBranch != null) 'lock_branch': lockBranch?.toJson(),
      if (allowForkSyncing != null)
        'allow_fork_syncing': allowForkSyncing?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    requiredStatusChecks,
    requiredPullRequestReviews,
    requiredSignatures,
    enforceAdmins,
    requiredLinearHistory,
    allowForcePushes,
    allowDeletions,
    restrictions,
    requiredConversationResolution,
    blockCreations,
    lockBranch,
    allowForkSyncing,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranch &&
        url == other.url &&
        requiredStatusChecks == other.requiredStatusChecks &&
        requiredPullRequestReviews == other.requiredPullRequestReviews &&
        requiredSignatures == other.requiredSignatures &&
        enforceAdmins == other.enforceAdmins &&
        requiredLinearHistory == other.requiredLinearHistory &&
        allowForcePushes == other.allowForcePushes &&
        allowDeletions == other.allowDeletions &&
        restrictions == other.restrictions &&
        requiredConversationResolution ==
            other.requiredConversationResolution &&
        blockCreations == other.blockCreations &&
        lockBranch == other.lockBranch &&
        allowForkSyncing == other.allowForkSyncing;
  }
}
