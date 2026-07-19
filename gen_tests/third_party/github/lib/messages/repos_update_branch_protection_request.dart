// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repos_update_branch_protection_request_required_pull_request_reviews.dart';
import 'package:github/models/repos_update_branch_protection_request_required_status_checks.dart';
import 'package:github/models/repos_update_branch_protection_request_restrictions.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateBranchProtectionRequest {
  const ReposUpdateBranchProtectionRequest({
    required this.requiredStatusChecks,
    required this.enforceAdmins,
    required this.requiredPullRequestReviews,
    required this.restrictions,
    this.requiredLinearHistory,
    this.allowForcePushes,
    this.allowDeletions,
    this.blockCreations,
    this.requiredConversationResolution,
    this.lockBranch = false,
    this.allowForkSyncing = false,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateBranchProtectionRequest].
  factory ReposUpdateBranchProtectionRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateBranchProtectionRequest',
      json,
      () => ReposUpdateBranchProtectionRequest(
        requiredStatusChecks:
            ReposUpdateBranchProtectionRequestRequiredStatusChecks.maybeFromJson(
              checkedKey(json, 'required_status_checks')
                  as Map<String, dynamic>?,
            ),
        enforceAdmins: checkedKey(json, 'enforce_admins') as bool?,
        requiredPullRequestReviews:
            ReposUpdateBranchProtectionRequestRequiredPullRequestReviews.maybeFromJson(
              checkedKey(json, 'required_pull_request_reviews')
                  as Map<String, dynamic>?,
            ),
        restrictions:
            ReposUpdateBranchProtectionRequestRestrictions.maybeFromJson(
              checkedKey(json, 'restrictions') as Map<String, dynamic>?,
            ),
        requiredLinearHistory: json['required_linear_history'] as bool?,
        allowForcePushes: json['allow_force_pushes'] as bool?,
        allowDeletions: json['allow_deletions'] as bool?,
        blockCreations: json['block_creations'] as bool?,
        requiredConversationResolution:
            json['required_conversation_resolution'] as bool?,
        lockBranch: (json['lock_branch'] as bool?) ?? false,
        allowForkSyncing: (json['allow_fork_syncing'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateBranchProtectionRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateBranchProtectionRequest.fromJson(json);
  }

  /// Require status checks to pass before merging. Set to `null` to disable.
  final ReposUpdateBranchProtectionRequestRequiredStatusChecks?
  requiredStatusChecks;

  /// Enforce all configured restrictions for administrators. Set to `true` to
  /// enforce required status checks for repository administrators. Set to
  /// `null` to disable.
  final bool? enforceAdmins;

  /// Require at least one approving review on a pull request, before merging.
  /// Set to `null` to disable.
  final ReposUpdateBranchProtectionRequestRequiredPullRequestReviews?
  requiredPullRequestReviews;

  /// Restrict who can push to the protected branch. User, app, and team
  /// `restrictions` are only available for organization-owned repositories.
  /// Set to `null` to disable.
  final ReposUpdateBranchProtectionRequestRestrictions? restrictions;

  /// Enforces a linear commit Git history, which prevents anyone from pushing
  /// merge commits to a branch. Set to `true` to enforce a linear commit
  /// history. Set to `false` to disable a linear commit Git history. Your
  /// repository must allow squash merging or rebase merging before you can
  /// enable a linear commit history. Default: `false`. For more information,
  /// see "[Requiring a linear commit
  /// history](https://docs.github.com/github/administering-a-repository/requiring-a-linear-commit-history)"
  /// in the GitHub Help documentation.
  final bool? requiredLinearHistory;

  /// Permits force pushes to the protected branch by anyone with write access
  /// to the repository. Set to `true` to allow force pushes. Set to `false`
  /// or `null` to block force pushes. Default: `false`. For more information,
  /// see "[Enabling force pushes to a protected
  /// branch](https://docs.github.com/github/administering-a-repository/enabling-force-pushes-to-a-protected-branch)"
  /// in the GitHub Help documentation."
  final bool? allowForcePushes;

  /// Allows deletion of the protected branch by anyone with write access to
  /// the repository. Set to `false` to prevent deletion of the protected
  /// branch. Default: `false`. For more information, see "[Enabling force
  /// pushes to a protected
  /// branch](https://docs.github.com/github/administering-a-repository/enabling-force-pushes-to-a-protected-branch)"
  /// in the GitHub Help documentation.
  final bool? allowDeletions;

  /// If set to `true`, the `restrictions` branch protection settings which
  /// limits who can push will also block pushes which create new branches,
  /// unless the push is initiated by a user, team, or app which has the
  /// ability to push. Set to `true` to restrict new branch creation. Default:
  /// `false`.
  final bool? blockCreations;

  /// Requires all conversations on code to be resolved before a pull request
  /// can be merged into a branch that matches this rule. Set to `false` to
  /// disable. Default: `false`.
  final bool? requiredConversationResolution;

  /// Whether to set the branch as read-only. If this is true, users will not
  /// be able to push to the branch. Default: `false`.
  final bool lockBranch;

  /// Whether users can pull changes from upstream when the branch is locked.
  /// Set to `true` to allow fork syncing. Set to `false` to prevent fork
  /// syncing. Default: `false`.
  final bool allowForkSyncing;

  /// Converts a [ReposUpdateBranchProtectionRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'required_status_checks': requiredStatusChecks?.toJson(),
      'enforce_admins': enforceAdmins,
      'required_pull_request_reviews': requiredPullRequestReviews?.toJson(),
      'restrictions': restrictions?.toJson(),
      if (requiredLinearHistory != null)
        'required_linear_history': requiredLinearHistory,
      'allow_force_pushes': allowForcePushes,
      if (allowDeletions != null) 'allow_deletions': allowDeletions,
      if (blockCreations != null) 'block_creations': blockCreations,
      if (requiredConversationResolution != null)
        'required_conversation_resolution': requiredConversationResolution,
      'lock_branch': lockBranch,
      'allow_fork_syncing': allowForkSyncing,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    requiredStatusChecks,
    enforceAdmins,
    requiredPullRequestReviews,
    restrictions,
    requiredLinearHistory,
    allowForcePushes,
    allowDeletions,
    blockCreations,
    requiredConversationResolution,
    lockBranch,
    allowForkSyncing,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateBranchProtectionRequest &&
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
        lockBranch == other.lockBranch &&
        allowForkSyncing == other.allowForkSyncing;
  }
}
