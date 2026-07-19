// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repos_update_request_merge_commit_message.dart';
import 'package:github/models/repos_update_request_merge_commit_title.dart';
import 'package:github/models/repos_update_request_security_and_analysis.dart';
import 'package:github/models/repos_update_request_squash_merge_commit_message.dart';
import 'package:github/models/repos_update_request_squash_merge_commit_title.dart';
import 'package:github/models/repos_update_request_visibility.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateRequest {
  const ReposUpdateRequest({
    this.name,
    this.description,
    this.homepage,
    this.private = false,
    this.visibility,
    this.securityAndAnalysis,
    this.hasIssues = true,
    this.hasProjects = true,
    this.hasWiki = true,
    this.isTemplate = false,
    this.defaultBranch,
    this.allowSquashMerge = true,
    this.allowMergeCommit = true,
    this.allowRebaseMerge = true,
    this.allowAutoMerge = false,
    this.deleteBranchOnMerge = false,
    this.allowUpdateBranch = false,
    @deprecated this.useSquashPrTitleAsDefault = false,
    this.squashMergeCommitTitle,
    this.squashMergeCommitMessage,
    this.mergeCommitTitle,
    this.mergeCommitMessage,
    this.archived = false,
    this.allowForking = false,
    this.webCommitSignoffRequired = false,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposUpdateRequest].
  factory ReposUpdateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposUpdateRequest',
      json,
      () => ReposUpdateRequest(
        name: json['name'] as String?,
        description: json['description'] as String?,
        homepage: json['homepage'] as String?,
        private: (json['private'] as bool?) ?? false,
        visibility: ReposUpdateRequestVisibility.maybeFromJson(
          json['visibility'] as String?,
        ),
        securityAndAnalysis:
            ReposUpdateRequestSecurityAndAnalysis.maybeFromJson(
              json['security_and_analysis'] as Map<String, dynamic>?,
            ),
        hasIssues: (json['has_issues'] as bool?) ?? true,
        hasProjects: (json['has_projects'] as bool?) ?? true,
        hasWiki: (json['has_wiki'] as bool?) ?? true,
        isTemplate: (json['is_template'] as bool?) ?? false,
        defaultBranch: json['default_branch'] as String?,
        allowSquashMerge: (json['allow_squash_merge'] as bool?) ?? true,
        allowMergeCommit: (json['allow_merge_commit'] as bool?) ?? true,
        allowRebaseMerge: (json['allow_rebase_merge'] as bool?) ?? true,
        allowAutoMerge: (json['allow_auto_merge'] as bool?) ?? false,
        deleteBranchOnMerge: (json['delete_branch_on_merge'] as bool?) ?? false,
        allowUpdateBranch: (json['allow_update_branch'] as bool?) ?? false,
        useSquashPrTitleAsDefault:
            (json['use_squash_pr_title_as_default'] as bool?) ?? false,
        squashMergeCommitTitle:
            ReposUpdateRequestSquashMergeCommitTitle.maybeFromJson(
              json['squash_merge_commit_title'] as String?,
            ),
        squashMergeCommitMessage:
            ReposUpdateRequestSquashMergeCommitMessage.maybeFromJson(
              json['squash_merge_commit_message'] as String?,
            ),
        mergeCommitTitle: ReposUpdateRequestMergeCommitTitle.maybeFromJson(
          json['merge_commit_title'] as String?,
        ),
        mergeCommitMessage: ReposUpdateRequestMergeCommitMessage.maybeFromJson(
          json['merge_commit_message'] as String?,
        ),
        archived: (json['archived'] as bool?) ?? false,
        allowForking: (json['allow_forking'] as bool?) ?? false,
        webCommitSignoffRequired:
            (json['web_commit_signoff_required'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateRequest.fromJson(json);
  }

  /// The name of the repository.
  final String? name;

  /// A short description of the repository.
  final String? description;

  /// A URL with more information about the repository.
  final String? homepage;

  /// Either `true` to make the repository private or `false` to make it
  /// public. Default: `false`.
  /// **Note**: You will get a `422` error if the organization restricts
  /// [changing repository
  /// visibility](https://docs.github.com/articles/repository-permission-levels-for-an-organization#changing-the-visibility-of-repositories)
  /// to organization owners and a non-owner tries to change the value of
  /// private.
  final bool private;

  /// The visibility of the repository.
  final ReposUpdateRequestVisibility? visibility;

  /// Specify which security and analysis features to enable or disable for
  /// the repository.
  ///
  /// To use this parameter, you must have admin permissions for the
  /// repository or be an owner or security manager for the organization that
  /// owns the repository. For more information, see "[Managing security
  /// managers in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  ///
  /// For example, to enable GitHub Advanced Security, use this data in the
  /// body of the `PATCH` request:
  /// `{ "security_and_analysis": {"advanced_security": { "status": "enabled" } } }`.
  ///
  /// You can check which security and analysis features are currently enabled
  /// by using a `GET /repos/{owner}/{repo}` request.
  final ReposUpdateRequestSecurityAndAnalysis? securityAndAnalysis;

  /// Either `true` to enable issues for this repository or `false` to disable
  /// them.
  final bool hasIssues;

  /// Either `true` to enable projects for this repository or `false` to
  /// disable them. **Note:** If you're creating a repository in an
  /// organization that has disabled repository projects, the default is
  /// `false`, and if you pass `true`, the API returns an error.
  final bool hasProjects;

  /// Either `true` to enable the wiki for this repository or `false` to
  /// disable it.
  final bool hasWiki;

  /// Either `true` to make this repo available as a template repository or
  /// `false` to prevent it.
  final bool isTemplate;

  /// Updates the default branch for this repository.
  final String? defaultBranch;

  /// Either `true` to allow squash-merging pull requests, or `false` to
  /// prevent squash-merging.
  final bool allowSquashMerge;

  /// Either `true` to allow merging pull requests with a merge commit, or
  /// `false` to prevent merging pull requests with merge commits.
  final bool allowMergeCommit;

  /// Either `true` to allow rebase-merging pull requests, or `false` to
  /// prevent rebase-merging.
  final bool allowRebaseMerge;

  /// Either `true` to allow auto-merge on pull requests, or `false` to
  /// disallow auto-merge.
  final bool allowAutoMerge;

  /// Either `true` to allow automatically deleting head branches when pull
  /// requests are merged, or `false` to prevent automatic deletion.
  final bool deleteBranchOnMerge;

  /// Either `true` to always allow a pull request head branch that is behind
  /// its base branch to be updated even if it is not required to be up to
  /// date before merging, or false otherwise.
  final bool allowUpdateBranch;

  /// Either `true` to allow squash-merge commits to use pull request title,
  /// or `false` to use commit message. **This property is closing down.
  /// Please use `squash_merge_commit_title` instead.
  @deprecated
  final bool useSquashPrTitleAsDefault;

  /// Required when using `squash_merge_commit_message`.
  ///
  /// The default value for a squash merge commit title:
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `COMMIT_OR_PR_TITLE` - default to the commit's title (if only one
  /// commit) or the pull request's title (when more than one commit).
  final ReposUpdateRequestSquashMergeCommitTitle? squashMergeCommitTitle;

  /// The default value for a squash merge commit message:
  ///
  /// - `PR_BODY` - default to the pull request's body.
  /// - `COMMIT_MESSAGES` - default to the branch's commit messages.
  /// - `BLANK` - default to a blank commit message.
  final ReposUpdateRequestSquashMergeCommitMessage? squashMergeCommitMessage;

  /// Required when using `merge_commit_message`.
  ///
  /// The default value for a merge commit title.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `MERGE_MESSAGE` - default to the classic title for a merge message
  /// (e.g., Merge pull request #123 from branch-name).
  final ReposUpdateRequestMergeCommitTitle? mergeCommitTitle;

  /// The default value for a merge commit message.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `PR_BODY` - default to the pull request's body.
  /// - `BLANK` - default to a blank commit message.
  final ReposUpdateRequestMergeCommitMessage? mergeCommitMessage;

  /// Whether to archive this repository. `false` will unarchive a previously
  /// archived repository.
  final bool archived;

  /// Either `true` to allow private forks, or `false` to prevent private
  /// forks.
  final bool allowForking;

  /// Either `true` to require contributors to sign off on web-based commits,
  /// or `false` to not require contributors to sign off on web-based commits.
  final bool webCommitSignoffRequired;

  /// Converts a [ReposUpdateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'homepage': homepage,
      'private': private,
      'visibility': visibility?.toJson(),
      'security_and_analysis': securityAndAnalysis?.toJson(),
      'has_issues': hasIssues,
      'has_projects': hasProjects,
      'has_wiki': hasWiki,
      'is_template': isTemplate,
      'default_branch': defaultBranch,
      'allow_squash_merge': allowSquashMerge,
      'allow_merge_commit': allowMergeCommit,
      'allow_rebase_merge': allowRebaseMerge,
      'allow_auto_merge': allowAutoMerge,
      'delete_branch_on_merge': deleteBranchOnMerge,
      'allow_update_branch': allowUpdateBranch,
      'use_squash_pr_title_as_default': useSquashPrTitleAsDefault,
      'squash_merge_commit_title': squashMergeCommitTitle?.toJson(),
      'squash_merge_commit_message': squashMergeCommitMessage?.toJson(),
      'merge_commit_title': mergeCommitTitle?.toJson(),
      'merge_commit_message': mergeCommitMessage?.toJson(),
      'archived': archived,
      'allow_forking': allowForking,
      'web_commit_signoff_required': webCommitSignoffRequired,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    homepage,
    private,
    visibility,
    securityAndAnalysis,
    hasIssues,
    hasProjects,
    hasWiki,
    isTemplate,
    defaultBranch,
    allowSquashMerge,
    allowMergeCommit,
    allowRebaseMerge,
    allowAutoMerge,
    deleteBranchOnMerge,
    allowUpdateBranch,
    useSquashPrTitleAsDefault,
    squashMergeCommitTitle,
    squashMergeCommitMessage,
    mergeCommitTitle,
    mergeCommitMessage,
    archived,
    allowForking,
    webCommitSignoffRequired,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateRequest &&
        name == other.name &&
        description == other.description &&
        homepage == other.homepage &&
        private == other.private &&
        visibility == other.visibility &&
        securityAndAnalysis == other.securityAndAnalysis &&
        hasIssues == other.hasIssues &&
        hasProjects == other.hasProjects &&
        hasWiki == other.hasWiki &&
        isTemplate == other.isTemplate &&
        defaultBranch == other.defaultBranch &&
        allowSquashMerge == other.allowSquashMerge &&
        allowMergeCommit == other.allowMergeCommit &&
        allowRebaseMerge == other.allowRebaseMerge &&
        allowAutoMerge == other.allowAutoMerge &&
        deleteBranchOnMerge == other.deleteBranchOnMerge &&
        allowUpdateBranch == other.allowUpdateBranch &&
        useSquashPrTitleAsDefault == other.useSquashPrTitleAsDefault &&
        squashMergeCommitTitle == other.squashMergeCommitTitle &&
        squashMergeCommitMessage == other.squashMergeCommitMessage &&
        mergeCommitTitle == other.mergeCommitTitle &&
        mergeCommitMessage == other.mergeCommitMessage &&
        archived == other.archived &&
        allowForking == other.allowForking &&
        webCommitSignoffRequired == other.webCommitSignoffRequired;
  }
}
