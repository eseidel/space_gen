// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repos_create_for_authenticated_user_request_merge_commit_message.dart';
import 'package:github/models/repos_create_for_authenticated_user_request_merge_commit_title.dart';
import 'package:github/models/repos_create_for_authenticated_user_request_squash_merge_commit_message.dart';
import 'package:github/models/repos_create_for_authenticated_user_request_squash_merge_commit_title.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateForAuthenticatedUserRequest {
  const ReposCreateForAuthenticatedUserRequest({
    required this.name,
    this.description,
    this.homepage,
    this.private = false,
    this.hasIssues = true,
    this.hasProjects = true,
    this.hasWiki = true,
    this.hasDiscussions = false,
    this.teamId,
    this.autoInit = false,
    this.gitignoreTemplate,
    this.licenseTemplate,
    this.allowSquashMerge = true,
    this.allowMergeCommit = true,
    this.allowRebaseMerge = true,
    this.allowAutoMerge = false,
    this.deleteBranchOnMerge = false,
    this.squashMergeCommitTitle,
    this.squashMergeCommitMessage,
    this.mergeCommitTitle,
    this.mergeCommitMessage,
    this.hasDownloads = true,
    this.isTemplate = false,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreateForAuthenticatedUserRequest].
  factory ReposCreateForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreateForAuthenticatedUserRequest',
      json,
      () => ReposCreateForAuthenticatedUserRequest(
        name: json['name'] as String,
        description: json['description'] as String?,
        homepage: json['homepage'] as String?,
        private: (json['private'] as bool?) ?? false,
        hasIssues: (json['has_issues'] as bool?) ?? true,
        hasProjects: (json['has_projects'] as bool?) ?? true,
        hasWiki: (json['has_wiki'] as bool?) ?? true,
        hasDiscussions: (json['has_discussions'] as bool?) ?? false,
        teamId: json['team_id'] as int?,
        autoInit: (json['auto_init'] as bool?) ?? false,
        gitignoreTemplate: json['gitignore_template'] as String?,
        licenseTemplate: json['license_template'] as String?,
        allowSquashMerge: (json['allow_squash_merge'] as bool?) ?? true,
        allowMergeCommit: (json['allow_merge_commit'] as bool?) ?? true,
        allowRebaseMerge: (json['allow_rebase_merge'] as bool?) ?? true,
        allowAutoMerge: (json['allow_auto_merge'] as bool?) ?? false,
        deleteBranchOnMerge: (json['delete_branch_on_merge'] as bool?) ?? false,
        squashMergeCommitTitle:
            ReposCreateForAuthenticatedUserRequestSquashMergeCommitTitle.maybeFromJson(
              json['squash_merge_commit_title'] as String?,
            ),
        squashMergeCommitMessage:
            ReposCreateForAuthenticatedUserRequestSquashMergeCommitMessage.maybeFromJson(
              json['squash_merge_commit_message'] as String?,
            ),
        mergeCommitTitle:
            ReposCreateForAuthenticatedUserRequestMergeCommitTitle.maybeFromJson(
              json['merge_commit_title'] as String?,
            ),
        mergeCommitMessage:
            ReposCreateForAuthenticatedUserRequestMergeCommitMessage.maybeFromJson(
              json['merge_commit_message'] as String?,
            ),
        hasDownloads: (json['has_downloads'] as bool?) ?? true,
        isTemplate: (json['is_template'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateForAuthenticatedUserRequest.fromJson(json);
  }

  /// The name of the repository.
  /// Example: `'Team Environment'`
  final String name;

  /// A short description of the repository.
  final String? description;

  /// A URL with more information about the repository.
  final String? homepage;

  /// Whether the repository is private.
  final bool private;

  /// Whether issues are enabled.
  /// Example: `true`
  final bool hasIssues;

  /// Whether projects are enabled.
  /// Example: `true`
  final bool hasProjects;

  /// Whether the wiki is enabled.
  /// Example: `true`
  final bool hasWiki;

  /// Whether discussions are enabled.
  /// Example: `true`
  final bool hasDiscussions;

  /// The id of the team that will be granted access to this repository. This
  /// is only valid when creating a repository in an organization.
  final int? teamId;

  /// Whether the repository is initialized with a minimal README.
  final bool autoInit;

  /// The desired language or platform to apply to the .gitignore.
  /// Example: `'Haskell'`
  final String? gitignoreTemplate;

  /// The license keyword of the open source license for this repository.
  /// Example: `'mit'`
  final String? licenseTemplate;

  /// Whether to allow squash merges for pull requests.
  /// Example: `true`
  final bool allowSquashMerge;

  /// Whether to allow merge commits for pull requests.
  /// Example: `true`
  final bool allowMergeCommit;

  /// Whether to allow rebase merges for pull requests.
  /// Example: `true`
  final bool allowRebaseMerge;

  /// Whether to allow Auto-merge to be used on pull requests.
  /// Example: `false`
  final bool allowAutoMerge;

  /// Whether to delete head branches when pull requests are merged
  /// Example: `false`
  final bool deleteBranchOnMerge;

  /// Required when using `squash_merge_commit_message`.
  ///
  /// The default value for a squash merge commit title:
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `COMMIT_OR_PR_TITLE` - default to the commit's title (if only one
  /// commit) or the pull request's title (when more than one commit).
  final ReposCreateForAuthenticatedUserRequestSquashMergeCommitTitle?
  squashMergeCommitTitle;

  /// The default value for a squash merge commit message:
  ///
  /// - `PR_BODY` - default to the pull request's body.
  /// - `COMMIT_MESSAGES` - default to the branch's commit messages.
  /// - `BLANK` - default to a blank commit message.
  final ReposCreateForAuthenticatedUserRequestSquashMergeCommitMessage?
  squashMergeCommitMessage;

  /// Required when using `merge_commit_message`.
  ///
  /// The default value for a merge commit title.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `MERGE_MESSAGE` - default to the classic title for a merge message
  /// (e.g., Merge pull request #123 from branch-name).
  final ReposCreateForAuthenticatedUserRequestMergeCommitTitle?
  mergeCommitTitle;

  /// The default value for a merge commit message.
  ///
  /// - `PR_TITLE` - default to the pull request's title.
  /// - `PR_BODY` - default to the pull request's body.
  /// - `BLANK` - default to a blank commit message.
  final ReposCreateForAuthenticatedUserRequestMergeCommitMessage?
  mergeCommitMessage;

  /// Whether downloads are enabled.
  /// Example: `true`
  final bool hasDownloads;

  /// Whether this repository acts as a template that can be used to generate
  /// new repositories.
  /// Example: `true`
  final bool isTemplate;

  /// Converts a [ReposCreateForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': ?description,
      'homepage': ?homepage,
      'private': private,
      'has_issues': hasIssues,
      'has_projects': hasProjects,
      'has_wiki': hasWiki,
      'has_discussions': hasDiscussions,
      'team_id': ?teamId,
      'auto_init': autoInit,
      'gitignore_template': ?gitignoreTemplate,
      'license_template': ?licenseTemplate,
      'allow_squash_merge': allowSquashMerge,
      'allow_merge_commit': allowMergeCommit,
      'allow_rebase_merge': allowRebaseMerge,
      'allow_auto_merge': allowAutoMerge,
      'delete_branch_on_merge': deleteBranchOnMerge,
      'squash_merge_commit_title': ?squashMergeCommitTitle?.toJson(),
      'squash_merge_commit_message': ?squashMergeCommitMessage?.toJson(),
      'merge_commit_title': ?mergeCommitTitle?.toJson(),
      'merge_commit_message': ?mergeCommitMessage?.toJson(),
      'has_downloads': hasDownloads,
      'is_template': isTemplate,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    homepage,
    private,
    hasIssues,
    hasProjects,
    hasWiki,
    hasDiscussions,
    teamId,
    autoInit,
    gitignoreTemplate,
    licenseTemplate,
    allowSquashMerge,
    allowMergeCommit,
    allowRebaseMerge,
    allowAutoMerge,
    deleteBranchOnMerge,
    squashMergeCommitTitle,
    squashMergeCommitMessage,
    mergeCommitTitle,
    mergeCommitMessage,
    hasDownloads,
    isTemplate,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateForAuthenticatedUserRequest &&
        name == other.name &&
        description == other.description &&
        homepage == other.homepage &&
        private == other.private &&
        hasIssues == other.hasIssues &&
        hasProjects == other.hasProjects &&
        hasWiki == other.hasWiki &&
        hasDiscussions == other.hasDiscussions &&
        teamId == other.teamId &&
        autoInit == other.autoInit &&
        gitignoreTemplate == other.gitignoreTemplate &&
        licenseTemplate == other.licenseTemplate &&
        allowSquashMerge == other.allowSquashMerge &&
        allowMergeCommit == other.allowMergeCommit &&
        allowRebaseMerge == other.allowRebaseMerge &&
        allowAutoMerge == other.allowAutoMerge &&
        deleteBranchOnMerge == other.deleteBranchOnMerge &&
        squashMergeCommitTitle == other.squashMergeCommitTitle &&
        squashMergeCommitMessage == other.squashMergeCommitMessage &&
        mergeCommitTitle == other.mergeCommitTitle &&
        mergeCommitMessage == other.mergeCommitMessage &&
        hasDownloads == other.hasDownloads &&
        isTemplate == other.isTemplate;
  }
}
