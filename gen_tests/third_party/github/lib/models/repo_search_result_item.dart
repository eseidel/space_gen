import 'package:github/model_helpers.dart';
import 'package:github/models/license_simple.dart';
import 'package:github/models/repo_search_result_item_permissions.dart';
import 'package:github/models/search_result_text_matches_inner.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template repo_search_result_item}
/// Repo Search Result Item
/// Repo Search Result Item
/// {@endtemplate}
@immutable
class RepoSearchResultItem {
  /// {@macro repo_search_result_item}
  const RepoSearchResultItem({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.owner,
    required this.private,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.homepage,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.forksCount,
    required this.openIssuesCount,
    required this.defaultBranch,
    required this.score,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.languagesUrl,
    required this.stargazersUrl,
    required this.contributorsUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.commitsUrl,
    required this.gitCommitsUrl,
    required this.commentsUrl,
    required this.issueCommentUrl,
    required this.contentsUrl,
    required this.compareUrl,
    required this.mergesUrl,
    required this.archiveUrl,
    required this.downloadsUrl,
    required this.issuesUrl,
    required this.pullsUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.labelsUrl,
    required this.releasesUrl,
    required this.deploymentsUrl,
    required this.gitUrl,
    required this.sshUrl,
    required this.cloneUrl,
    required this.svnUrl,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.mirrorUrl,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasPages,
    required this.hasWiki,
    required this.hasDownloads,
    required this.archived,
    required this.disabled,
    required this.license,
    this.masterBranch,
    this.topics,
    this.hasDiscussions,
    this.visibility,
    this.permissions,
    this.textMatches,
    this.tempCloneToken,
    this.allowMergeCommit,
    this.allowSquashMerge,
    this.allowRebaseMerge,
    this.allowAutoMerge,
    this.deleteBranchOnMerge,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
  });

  /// Converts a `Map<String, dynamic>` to a [RepoSearchResultItem].
  factory RepoSearchResultItem.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepoSearchResultItem',
      json,
      () => RepoSearchResultItem(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        name: json['name'] as String,
        fullName: json['full_name'] as String,
        owner: SimpleUser.maybeFromJson(
          checkedKey(json, 'owner') as Map<String, dynamic>?,
        ),
        private: json['private'] as bool,
        htmlUrl: Uri.parse(json['html_url'] as String),
        description: checkedKey(json, 'description') as String?,
        fork: json['fork'] as bool,
        url: Uri.parse(json['url'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        pushedAt: DateTime.parse(json['pushed_at'] as String),
        homepage: maybeParseUri(checkedKey(json, 'homepage') as String?),
        size: json['size'] as int,
        stargazersCount: json['stargazers_count'] as int,
        watchersCount: json['watchers_count'] as int,
        language: checkedKey(json, 'language') as String?,
        forksCount: json['forks_count'] as int,
        openIssuesCount: json['open_issues_count'] as int,
        masterBranch: json['master_branch'] as String?,
        defaultBranch: json['default_branch'] as String,
        score: (json['score'] as num).toDouble(),
        forksUrl: Uri.parse(json['forks_url'] as String),
        keysUrl: json['keys_url'] as String,
        collaboratorsUrl: json['collaborators_url'] as String,
        teamsUrl: Uri.parse(json['teams_url'] as String),
        hooksUrl: Uri.parse(json['hooks_url'] as String),
        issueEventsUrl: json['issue_events_url'] as String,
        eventsUrl: Uri.parse(json['events_url'] as String),
        assigneesUrl: json['assignees_url'] as String,
        branchesUrl: json['branches_url'] as String,
        tagsUrl: Uri.parse(json['tags_url'] as String),
        blobsUrl: json['blobs_url'] as String,
        gitTagsUrl: json['git_tags_url'] as String,
        gitRefsUrl: json['git_refs_url'] as String,
        treesUrl: json['trees_url'] as String,
        statusesUrl: json['statuses_url'] as String,
        languagesUrl: Uri.parse(json['languages_url'] as String),
        stargazersUrl: Uri.parse(json['stargazers_url'] as String),
        contributorsUrl: Uri.parse(json['contributors_url'] as String),
        subscribersUrl: Uri.parse(json['subscribers_url'] as String),
        subscriptionUrl: Uri.parse(json['subscription_url'] as String),
        commitsUrl: json['commits_url'] as String,
        gitCommitsUrl: json['git_commits_url'] as String,
        commentsUrl: json['comments_url'] as String,
        issueCommentUrl: json['issue_comment_url'] as String,
        contentsUrl: json['contents_url'] as String,
        compareUrl: json['compare_url'] as String,
        mergesUrl: Uri.parse(json['merges_url'] as String),
        archiveUrl: json['archive_url'] as String,
        downloadsUrl: Uri.parse(json['downloads_url'] as String),
        issuesUrl: json['issues_url'] as String,
        pullsUrl: json['pulls_url'] as String,
        milestonesUrl: json['milestones_url'] as String,
        notificationsUrl: json['notifications_url'] as String,
        labelsUrl: json['labels_url'] as String,
        releasesUrl: json['releases_url'] as String,
        deploymentsUrl: Uri.parse(json['deployments_url'] as String),
        gitUrl: json['git_url'] as String,
        sshUrl: json['ssh_url'] as String,
        cloneUrl: json['clone_url'] as String,
        svnUrl: Uri.parse(json['svn_url'] as String),
        forks: json['forks'] as int,
        openIssues: json['open_issues'] as int,
        watchers: json['watchers'] as int,
        topics: (json['topics'] as List?)?.cast<String>(),
        mirrorUrl: maybeParseUri(checkedKey(json, 'mirror_url') as String?),
        hasIssues: json['has_issues'] as bool,
        hasProjects: json['has_projects'] as bool,
        hasPages: json['has_pages'] as bool,
        hasWiki: json['has_wiki'] as bool,
        hasDownloads: json['has_downloads'] as bool,
        hasDiscussions: json['has_discussions'] as bool?,
        archived: json['archived'] as bool,
        disabled: json['disabled'] as bool,
        visibility: json['visibility'] as String?,
        license: LicenseSimple.maybeFromJson(
          checkedKey(json, 'license') as Map<String, dynamic>?,
        ),
        permissions: RepoSearchResultItemPermissions.maybeFromJson(
          json['permissions'] as Map<String, dynamic>?,
        ),
        textMatches: (json['text_matches'] as List?)
            ?.map<SearchResultTextMatchesInner>(
              (e) => SearchResultTextMatchesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        tempCloneToken: json['temp_clone_token'] as String?,
        allowMergeCommit: json['allow_merge_commit'] as bool?,
        allowSquashMerge: json['allow_squash_merge'] as bool?,
        allowRebaseMerge: json['allow_rebase_merge'] as bool?,
        allowAutoMerge: json['allow_auto_merge'] as bool?,
        deleteBranchOnMerge: json['delete_branch_on_merge'] as bool?,
        allowForking: json['allow_forking'] as bool?,
        isTemplate: json['is_template'] as bool?,
        webCommitSignoffRequired: json['web_commit_signoff_required'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepoSearchResultItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepoSearchResultItem.fromJson(json);
  }

  final int id;
  final String nodeId;
  final String name;
  final String fullName;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? owner;
  final bool private;
  final Uri htmlUrl;
  final String? description;
  final bool fork;
  final Uri url;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime pushedAt;
  final Uri? homepage;
  final int size;
  final int stargazersCount;
  final int watchersCount;
  final String? language;
  final int forksCount;
  final int openIssuesCount;
  final String? masterBranch;
  final String defaultBranch;
  final double score;
  final Uri forksUrl;
  final String keysUrl;
  final String collaboratorsUrl;
  final Uri teamsUrl;
  final Uri hooksUrl;
  final String issueEventsUrl;
  final Uri eventsUrl;
  final String assigneesUrl;
  final String branchesUrl;
  final Uri tagsUrl;
  final String blobsUrl;
  final String gitTagsUrl;
  final String gitRefsUrl;
  final String treesUrl;
  final String statusesUrl;
  final Uri languagesUrl;
  final Uri stargazersUrl;
  final Uri contributorsUrl;
  final Uri subscribersUrl;
  final Uri subscriptionUrl;
  final String commitsUrl;
  final String gitCommitsUrl;
  final String commentsUrl;
  final String issueCommentUrl;
  final String contentsUrl;
  final String compareUrl;
  final Uri mergesUrl;
  final String archiveUrl;
  final Uri downloadsUrl;
  final String issuesUrl;
  final String pullsUrl;
  final String milestonesUrl;
  final String notificationsUrl;
  final String labelsUrl;
  final String releasesUrl;
  final Uri deploymentsUrl;
  final String gitUrl;
  final String sshUrl;
  final String cloneUrl;
  final Uri svnUrl;
  final int forks;
  final int openIssues;
  final int watchers;
  final List<String>? topics;
  final Uri? mirrorUrl;
  final bool hasIssues;
  final bool hasProjects;
  final bool hasPages;
  final bool hasWiki;
  final bool hasDownloads;
  final bool? hasDiscussions;
  final bool archived;

  /// Returns whether or not this repository disabled.
  final bool disabled;

  /// The repository visibility: public, private, or internal.
  final String? visibility;

  /// License Simple
  /// License Simple
  final LicenseSimple? license;
  final RepoSearchResultItemPermissions? permissions;

  /// Search Result Text Matches
  final List<SearchResultTextMatchesInner>? textMatches;
  final String? tempCloneToken;
  final bool? allowMergeCommit;
  final bool? allowSquashMerge;
  final bool? allowRebaseMerge;
  final bool? allowAutoMerge;
  final bool? deleteBranchOnMerge;
  final bool? allowForking;
  final bool? isTemplate;

  /// Example: `false`
  final bool? webCommitSignoffRequired;

  /// Converts a [RepoSearchResultItem] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'name': name,
      'full_name': fullName,
      'owner': owner?.toJson(),
      'private': private,
      'html_url': htmlUrl.toString(),
      'description': description,
      'fork': fork,
      'url': url.toString(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'pushed_at': pushedAt.toIso8601String(),
      'homepage': homepage?.toString(),
      'size': size,
      'stargazers_count': stargazersCount,
      'watchers_count': watchersCount,
      'language': language,
      'forks_count': forksCount,
      'open_issues_count': openIssuesCount,
      'master_branch': masterBranch,
      'default_branch': defaultBranch,
      'score': score,
      'forks_url': forksUrl.toString(),
      'keys_url': keysUrl,
      'collaborators_url': collaboratorsUrl,
      'teams_url': teamsUrl.toString(),
      'hooks_url': hooksUrl.toString(),
      'issue_events_url': issueEventsUrl,
      'events_url': eventsUrl.toString(),
      'assignees_url': assigneesUrl,
      'branches_url': branchesUrl,
      'tags_url': tagsUrl.toString(),
      'blobs_url': blobsUrl,
      'git_tags_url': gitTagsUrl,
      'git_refs_url': gitRefsUrl,
      'trees_url': treesUrl,
      'statuses_url': statusesUrl,
      'languages_url': languagesUrl.toString(),
      'stargazers_url': stargazersUrl.toString(),
      'contributors_url': contributorsUrl.toString(),
      'subscribers_url': subscribersUrl.toString(),
      'subscription_url': subscriptionUrl.toString(),
      'commits_url': commitsUrl,
      'git_commits_url': gitCommitsUrl,
      'comments_url': commentsUrl,
      'issue_comment_url': issueCommentUrl,
      'contents_url': contentsUrl,
      'compare_url': compareUrl,
      'merges_url': mergesUrl.toString(),
      'archive_url': archiveUrl,
      'downloads_url': downloadsUrl.toString(),
      'issues_url': issuesUrl,
      'pulls_url': pullsUrl,
      'milestones_url': milestonesUrl,
      'notifications_url': notificationsUrl,
      'labels_url': labelsUrl,
      'releases_url': releasesUrl,
      'deployments_url': deploymentsUrl.toString(),
      'git_url': gitUrl,
      'ssh_url': sshUrl,
      'clone_url': cloneUrl,
      'svn_url': svnUrl.toString(),
      'forks': forks,
      'open_issues': openIssues,
      'watchers': watchers,
      'topics': topics,
      'mirror_url': mirrorUrl?.toString(),
      'has_issues': hasIssues,
      'has_projects': hasProjects,
      'has_pages': hasPages,
      'has_wiki': hasWiki,
      'has_downloads': hasDownloads,
      'has_discussions': hasDiscussions,
      'archived': archived,
      'disabled': disabled,
      'visibility': visibility,
      'license': license?.toJson(),
      'permissions': permissions?.toJson(),
      'text_matches': textMatches?.map((e) => e.toJson()).toList(),
      'temp_clone_token': tempCloneToken,
      'allow_merge_commit': allowMergeCommit,
      'allow_squash_merge': allowSquashMerge,
      'allow_rebase_merge': allowRebaseMerge,
      'allow_auto_merge': allowAutoMerge,
      'delete_branch_on_merge': deleteBranchOnMerge,
      'allow_forking': allowForking,
      'is_template': isTemplate,
      'web_commit_signoff_required': webCommitSignoffRequired,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    name,
    fullName,
    owner,
    private,
    htmlUrl,
    description,
    fork,
    url,
    createdAt,
    updatedAt,
    pushedAt,
    homepage,
    size,
    stargazersCount,
    watchersCount,
    language,
    forksCount,
    openIssuesCount,
    masterBranch,
    defaultBranch,
    score,
    forksUrl,
    keysUrl,
    collaboratorsUrl,
    teamsUrl,
    hooksUrl,
    issueEventsUrl,
    eventsUrl,
    assigneesUrl,
    branchesUrl,
    tagsUrl,
    blobsUrl,
    gitTagsUrl,
    gitRefsUrl,
    treesUrl,
    statusesUrl,
    languagesUrl,
    stargazersUrl,
    contributorsUrl,
    subscribersUrl,
    subscriptionUrl,
    commitsUrl,
    gitCommitsUrl,
    commentsUrl,
    issueCommentUrl,
    contentsUrl,
    compareUrl,
    mergesUrl,
    archiveUrl,
    downloadsUrl,
    issuesUrl,
    pullsUrl,
    milestonesUrl,
    notificationsUrl,
    labelsUrl,
    releasesUrl,
    deploymentsUrl,
    gitUrl,
    sshUrl,
    cloneUrl,
    svnUrl,
    forks,
    openIssues,
    watchers,
    listHash(topics),
    mirrorUrl,
    hasIssues,
    hasProjects,
    hasPages,
    hasWiki,
    hasDownloads,
    hasDiscussions,
    archived,
    disabled,
    visibility,
    license,
    permissions,
    listHash(textMatches),
    tempCloneToken,
    allowMergeCommit,
    allowSquashMerge,
    allowRebaseMerge,
    allowAutoMerge,
    deleteBranchOnMerge,
    allowForking,
    isTemplate,
    webCommitSignoffRequired,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepoSearchResultItem &&
        id == other.id &&
        nodeId == other.nodeId &&
        name == other.name &&
        fullName == other.fullName &&
        owner == other.owner &&
        private == other.private &&
        htmlUrl == other.htmlUrl &&
        description == other.description &&
        fork == other.fork &&
        url == other.url &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        pushedAt == other.pushedAt &&
        homepage == other.homepage &&
        size == other.size &&
        stargazersCount == other.stargazersCount &&
        watchersCount == other.watchersCount &&
        language == other.language &&
        forksCount == other.forksCount &&
        openIssuesCount == other.openIssuesCount &&
        masterBranch == other.masterBranch &&
        defaultBranch == other.defaultBranch &&
        score == other.score &&
        forksUrl == other.forksUrl &&
        keysUrl == other.keysUrl &&
        collaboratorsUrl == other.collaboratorsUrl &&
        teamsUrl == other.teamsUrl &&
        hooksUrl == other.hooksUrl &&
        issueEventsUrl == other.issueEventsUrl &&
        eventsUrl == other.eventsUrl &&
        assigneesUrl == other.assigneesUrl &&
        branchesUrl == other.branchesUrl &&
        tagsUrl == other.tagsUrl &&
        blobsUrl == other.blobsUrl &&
        gitTagsUrl == other.gitTagsUrl &&
        gitRefsUrl == other.gitRefsUrl &&
        treesUrl == other.treesUrl &&
        statusesUrl == other.statusesUrl &&
        languagesUrl == other.languagesUrl &&
        stargazersUrl == other.stargazersUrl &&
        contributorsUrl == other.contributorsUrl &&
        subscribersUrl == other.subscribersUrl &&
        subscriptionUrl == other.subscriptionUrl &&
        commitsUrl == other.commitsUrl &&
        gitCommitsUrl == other.gitCommitsUrl &&
        commentsUrl == other.commentsUrl &&
        issueCommentUrl == other.issueCommentUrl &&
        contentsUrl == other.contentsUrl &&
        compareUrl == other.compareUrl &&
        mergesUrl == other.mergesUrl &&
        archiveUrl == other.archiveUrl &&
        downloadsUrl == other.downloadsUrl &&
        issuesUrl == other.issuesUrl &&
        pullsUrl == other.pullsUrl &&
        milestonesUrl == other.milestonesUrl &&
        notificationsUrl == other.notificationsUrl &&
        labelsUrl == other.labelsUrl &&
        releasesUrl == other.releasesUrl &&
        deploymentsUrl == other.deploymentsUrl &&
        gitUrl == other.gitUrl &&
        sshUrl == other.sshUrl &&
        cloneUrl == other.cloneUrl &&
        svnUrl == other.svnUrl &&
        forks == other.forks &&
        openIssues == other.openIssues &&
        watchers == other.watchers &&
        listsEqual(topics, other.topics) &&
        mirrorUrl == other.mirrorUrl &&
        hasIssues == other.hasIssues &&
        hasProjects == other.hasProjects &&
        hasPages == other.hasPages &&
        hasWiki == other.hasWiki &&
        hasDownloads == other.hasDownloads &&
        hasDiscussions == other.hasDiscussions &&
        archived == other.archived &&
        disabled == other.disabled &&
        visibility == other.visibility &&
        license == other.license &&
        permissions == other.permissions &&
        listsEqual(textMatches, other.textMatches) &&
        tempCloneToken == other.tempCloneToken &&
        allowMergeCommit == other.allowMergeCommit &&
        allowSquashMerge == other.allowSquashMerge &&
        allowRebaseMerge == other.allowRebaseMerge &&
        allowAutoMerge == other.allowAutoMerge &&
        deleteBranchOnMerge == other.deleteBranchOnMerge &&
        allowForking == other.allowForking &&
        isTemplate == other.isTemplate &&
        webCommitSignoffRequired == other.webCommitSignoffRequired;
  }
}
