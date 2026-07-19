// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repos_create_in_org_request_merge_commit_message.dart';
import 'package:github/models/repos_create_in_org_request_merge_commit_title.dart';
import 'package:github/models/repos_create_in_org_request_squash_merge_commit_message.dart';
import 'package:github/models/repos_create_in_org_request_squash_merge_commit_title.dart';
import 'package:github/models/repos_create_in_org_request_visibility.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateInOrgRequest {
  const ReposCreateInOrgRequest({
    required this.name,
    this.description,
    this.homepage,
    this.private = false,
    this.visibility,
    this.hasIssues = true,
    this.hasProjects = true,
    this.hasWiki = true,
    this.hasDownloads = true,
    this.isTemplate = false,
    this.teamId,
    this.autoInit = false,
    this.gitignoreTemplate,
    this.licenseTemplate,
    this.allowSquashMerge = true,
    this.allowMergeCommit = true,
    this.allowRebaseMerge = true,
    this.allowAutoMerge = false,
    this.deleteBranchOnMerge = false,
    @deprecated this.useSquashPrTitleAsDefault = false,
    this.squashMergeCommitTitle,
    this.squashMergeCommitMessage,
    this.mergeCommitTitle,
    this.mergeCommitMessage,
    this.customProperties,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposCreateInOrgRequest].
  factory ReposCreateInOrgRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateInOrgRequest',
      json,
      () => ReposCreateInOrgRequest(
        name: json['name'] as String,
        description: json['description'] as String?,
        homepage: json['homepage'] as String?,
        private: (json['private'] as bool?) ?? false,
        visibility: ReposCreateInOrgRequestVisibility.maybeFromJson(
          json['visibility'] as String?,
        ),
        hasIssues: (json['has_issues'] as bool?) ?? true,
        hasProjects: (json['has_projects'] as bool?) ?? true,
        hasWiki: (json['has_wiki'] as bool?) ?? true,
        hasDownloads: (json['has_downloads'] as bool?) ?? true,
        isTemplate: (json['is_template'] as bool?) ?? false,
        teamId: json['team_id'] as int?,
        autoInit: (json['auto_init'] as bool?) ?? false,
        gitignoreTemplate: json['gitignore_template'] as String?,
        licenseTemplate: json['license_template'] as String?,
        allowSquashMerge: (json['allow_squash_merge'] as bool?) ?? true,
        allowMergeCommit: (json['allow_merge_commit'] as bool?) ?? true,
        allowRebaseMerge: (json['allow_rebase_merge'] as bool?) ?? true,
        allowAutoMerge: (json['allow_auto_merge'] as bool?) ?? false,
        deleteBranchOnMerge: (json['delete_branch_on_merge'] as bool?) ?? false,
        useSquashPrTitleAsDefault:
            (json['use_squash_pr_title_as_default'] as bool?) ?? false,
        squashMergeCommitTitle:
            ReposCreateInOrgRequestSquashMergeCommitTitle.maybeFromJson(
              json['squash_merge_commit_title'] as String?,
            ),
        squashMergeCommitMessage:
            ReposCreateInOrgRequestSquashMergeCommitMessage.maybeFromJson(
              json['squash_merge_commit_message'] as String?,
            ),
        mergeCommitTitle: ReposCreateInOrgRequestMergeCommitTitle.maybeFromJson(
          json['merge_commit_title'] as String?,
        ),
        mergeCommitMessage:
            ReposCreateInOrgRequestMergeCommitMessage.maybeFromJson(
              json['merge_commit_message'] as String?,
            ),
        customProperties: json['custom_properties'] as Map<String, dynamic>?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateInOrgRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateInOrgRequest.fromJson(json);
  }

  /// The name of the repository.
  final String name;

  /// A short description of the repository.
  final String? description;

  /// A URL with more information about the repository.
  final String? homepage;

  /// Whether the repository is private.
  final bool private;

  /// The visibility of the repository.
  final ReposCreateInOrgRequestVisibility? visibility;

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

  /// Whether downloads are enabled.
  /// Example: `true`
  final bool hasDownloads;

  /// Either `true` to make this repo available as a template repository or
  /// `false` to prevent it.
  final bool isTemplate;

  /// The id of the team that will be granted access to this repository. This
  /// is only valid when creating a repository in an organization.
  final int? teamId;

  /// Pass `true` to create an initial commit with empty README.
  final bool autoInit;

  /// Desired language or platform [.gitignore
  /// template](https://github.com/github/gitignore) to apply. Use the name of
  /// the template without the extension. For example, "Haskell".
  final String? gitignoreTemplate;

  /// Choose an [open source license template](https://choosealicense.com/)
  /// that best suits your needs, and then use the [license
  /// keyword](https://docs.github.com/articles/licensing-a-repository/#searching-github-by-license-type)
  /// as the `license_template` string. For example, "mit" or "mpl-2.0".
  final String? licenseTemplate;

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
  /// requests are merged, or `false` to prevent automatic deletion. **The
  /// authenticated user must be an organization owner to set this property to
  /// `true`.**
  final bool deleteBranchOnMerge;

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
  final ReposCreateInOrgRequestSquashMergeCommitTitle? squashMergeCommitTitle;

  /// The default value for a squash merge commit message:
  ///
  /// - `PR_BODY` - default to the pull request's body.
  /// - `COMMIT_MESSAGES` - default to the branch's commit messages.
  /// - `BLANK` - default to a blank commit message.
  final ReposCreateInOrgRequestSquashMergeCommitMessage?
  squashMergeCommitMessage;

  /// Required when using `merge_commit_message`.
  ///
  /// The default value for a merge commit title.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `MERGE_MESSAGE` - default to the classic title for a merge message
  /// (e.g., Merge pull request #123 from branch-name).
  final ReposCreateInOrgRequestMergeCommitTitle? mergeCommitTitle;

  /// The default value for a merge commit message.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `PR_BODY` - default to the pull request's body.
  /// - `BLANK` - default to a blank commit message.
  final ReposCreateInOrgRequestMergeCommitMessage? mergeCommitMessage;

  /// The custom properties for the new repository. The keys are the custom
  /// property names, and the values are the corresponding custom property
  /// values.
  final Map<String, dynamic>? customProperties;

  /// Converts a [ReposCreateInOrgRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'homepage': homepage,
      'private': private,
      'visibility': visibility?.toJson(),
      'has_issues': hasIssues,
      'has_projects': hasProjects,
      'has_wiki': hasWiki,
      'has_downloads': hasDownloads,
      'is_template': isTemplate,
      'team_id': teamId,
      'auto_init': autoInit,
      'gitignore_template': gitignoreTemplate,
      'license_template': licenseTemplate,
      'allow_squash_merge': allowSquashMerge,
      'allow_merge_commit': allowMergeCommit,
      'allow_rebase_merge': allowRebaseMerge,
      'allow_auto_merge': allowAutoMerge,
      'delete_branch_on_merge': deleteBranchOnMerge,
      'use_squash_pr_title_as_default': useSquashPrTitleAsDefault,
      'squash_merge_commit_title': squashMergeCommitTitle?.toJson(),
      'squash_merge_commit_message': squashMergeCommitMessage?.toJson(),
      'merge_commit_title': mergeCommitTitle?.toJson(),
      'merge_commit_message': mergeCommitMessage?.toJson(),
      'custom_properties': customProperties,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    homepage,
    private,
    visibility,
    hasIssues,
    hasProjects,
    hasWiki,
    hasDownloads,
    isTemplate,
    teamId,
    autoInit,
    gitignoreTemplate,
    licenseTemplate,
    allowSquashMerge,
    allowMergeCommit,
    allowRebaseMerge,
    allowAutoMerge,
    deleteBranchOnMerge,
    useSquashPrTitleAsDefault,
    squashMergeCommitTitle,
    squashMergeCommitMessage,
    mergeCommitTitle,
    mergeCommitMessage,
    mapHash(customProperties),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateInOrgRequest &&
        name == other.name &&
        description == other.description &&
        homepage == other.homepage &&
        private == other.private &&
        visibility == other.visibility &&
        hasIssues == other.hasIssues &&
        hasProjects == other.hasProjects &&
        hasWiki == other.hasWiki &&
        hasDownloads == other.hasDownloads &&
        isTemplate == other.isTemplate &&
        teamId == other.teamId &&
        autoInit == other.autoInit &&
        gitignoreTemplate == other.gitignoreTemplate &&
        licenseTemplate == other.licenseTemplate &&
        allowSquashMerge == other.allowSquashMerge &&
        allowMergeCommit == other.allowMergeCommit &&
        allowRebaseMerge == other.allowRebaseMerge &&
        allowAutoMerge == other.allowAutoMerge &&
        deleteBranchOnMerge == other.deleteBranchOnMerge &&
        useSquashPrTitleAsDefault == other.useSquashPrTitleAsDefault &&
        squashMergeCommitTitle == other.squashMergeCommitTitle &&
        squashMergeCommitMessage == other.squashMergeCommitMessage &&
        mergeCommitTitle == other.mergeCommitTitle &&
        mergeCommitMessage == other.mergeCommitMessage &&
        mapsEqual(customProperties, other.customProperties);
  }
}
