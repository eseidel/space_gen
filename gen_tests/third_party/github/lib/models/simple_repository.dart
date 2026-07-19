// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template simple_repository}
/// Simple Repository
/// A GitHub repository.
/// {@endtemplate}
@immutable
class SimpleRepository {
  /// {@macro simple_repository}
  const SimpleRepository({
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
    required this.archiveUrl,
    required this.assigneesUrl,
    required this.blobsUrl,
    required this.branchesUrl,
    required this.collaboratorsUrl,
    required this.commentsUrl,
    required this.commitsUrl,
    required this.compareUrl,
    required this.contentsUrl,
    required this.contributorsUrl,
    required this.deploymentsUrl,
    required this.downloadsUrl,
    required this.eventsUrl,
    required this.forksUrl,
    required this.gitCommitsUrl,
    required this.gitRefsUrl,
    required this.gitTagsUrl,
    required this.issueCommentUrl,
    required this.issueEventsUrl,
    required this.issuesUrl,
    required this.keysUrl,
    required this.labelsUrl,
    required this.languagesUrl,
    required this.mergesUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.pullsUrl,
    required this.releasesUrl,
    required this.stargazersUrl,
    required this.statusesUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.tagsUrl,
    required this.teamsUrl,
    required this.treesUrl,
    required this.hooksUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [SimpleRepository].
  factory SimpleRepository.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SimpleRepository',
      json,
      () => SimpleRepository(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        name: json['name'] as String,
        fullName: json['full_name'] as String,
        owner: SimpleUser.fromJson(json['owner'] as Map<String, dynamic>),
        private: json['private'] as bool,
        htmlUrl: Uri.parse(json['html_url'] as String),
        description: checkedKey(json, 'description') as String?,
        fork: json['fork'] as bool,
        url: Uri.parse(json['url'] as String),
        archiveUrl: json['archive_url'] as String,
        assigneesUrl: json['assignees_url'] as String,
        blobsUrl: json['blobs_url'] as String,
        branchesUrl: json['branches_url'] as String,
        collaboratorsUrl: json['collaborators_url'] as String,
        commentsUrl: json['comments_url'] as String,
        commitsUrl: json['commits_url'] as String,
        compareUrl: json['compare_url'] as String,
        contentsUrl: json['contents_url'] as String,
        contributorsUrl: Uri.parse(json['contributors_url'] as String),
        deploymentsUrl: Uri.parse(json['deployments_url'] as String),
        downloadsUrl: Uri.parse(json['downloads_url'] as String),
        eventsUrl: Uri.parse(json['events_url'] as String),
        forksUrl: Uri.parse(json['forks_url'] as String),
        gitCommitsUrl: json['git_commits_url'] as String,
        gitRefsUrl: json['git_refs_url'] as String,
        gitTagsUrl: json['git_tags_url'] as String,
        issueCommentUrl: json['issue_comment_url'] as String,
        issueEventsUrl: json['issue_events_url'] as String,
        issuesUrl: json['issues_url'] as String,
        keysUrl: json['keys_url'] as String,
        labelsUrl: json['labels_url'] as String,
        languagesUrl: Uri.parse(json['languages_url'] as String),
        mergesUrl: Uri.parse(json['merges_url'] as String),
        milestonesUrl: json['milestones_url'] as String,
        notificationsUrl: json['notifications_url'] as String,
        pullsUrl: json['pulls_url'] as String,
        releasesUrl: json['releases_url'] as String,
        stargazersUrl: Uri.parse(json['stargazers_url'] as String),
        statusesUrl: json['statuses_url'] as String,
        subscribersUrl: Uri.parse(json['subscribers_url'] as String),
        subscriptionUrl: Uri.parse(json['subscription_url'] as String),
        tagsUrl: Uri.parse(json['tags_url'] as String),
        teamsUrl: Uri.parse(json['teams_url'] as String),
        treesUrl: json['trees_url'] as String,
        hooksUrl: Uri.parse(json['hooks_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SimpleRepository? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SimpleRepository.fromJson(json);
  }

  /// A unique identifier of the repository.
  /// Example: `1296269`
  final int id;

  /// The GraphQL identifier of the repository.
  /// Example: `'MDEwOlJlcG9zaXRvcnkxMjk2MjY5'`
  final String nodeId;

  /// The name of the repository.
  /// Example: `'Hello-World'`
  final String name;

  /// The full, globally unique, name of the repository.
  /// Example: `'octocat/Hello-World'`
  final String fullName;

  /// Simple User
  /// A GitHub user.
  final SimpleUser owner;

  /// Whether the repository is private.
  final bool private;

  /// The URL to view the repository on GitHub.com.
  /// Example: `'https://github.com/octocat/Hello-World'`
  final Uri htmlUrl;

  /// The repository description.
  /// Example: `'This your first repo!'`
  final String? description;

  /// Whether the repository is a fork.
  final bool fork;

  /// The URL to get more information about the repository from the GitHub
  /// API.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World'`
  final Uri url;

  /// A template for the API URL to download the repository as an archive.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/{archive_format}{/ref}'`
  final String archiveUrl;

  /// A template for the API URL to list the available assignees for issues in
  /// the repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/assignees{/user}'`
  final String assigneesUrl;

  /// A template for the API URL to create or retrieve a raw Git blob in the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/git/blobs{/sha}'`
  final String blobsUrl;

  /// A template for the API URL to get information about branches in the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/branches{/branch}'`
  final String branchesUrl;

  /// A template for the API URL to get information about collaborators of the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/collaborators{/collaborator}'`
  final String collaboratorsUrl;

  /// A template for the API URL to get information about comments on the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/comments{/number}'`
  final String commentsUrl;

  /// A template for the API URL to get information about commits on the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/commits{/sha}'`
  final String commitsUrl;

  /// A template for the API URL to compare two commits or refs.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/compare/{base}...{head}'`
  final String compareUrl;

  /// A template for the API URL to get the contents of the repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/contents/{+path}'`
  final String contentsUrl;

  /// A template for the API URL to list the contributors to the repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/contributors'`
  final Uri contributorsUrl;

  /// The API URL to list the deployments of the repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/deployments'`
  final Uri deploymentsUrl;

  /// The API URL to list the downloads on the repository.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/downloads'`
  final Uri downloadsUrl;

  /// The API URL to list the events of the repository.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/events'`
  final Uri eventsUrl;

  /// The API URL to list the forks of the repository.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/forks'`
  final Uri forksUrl;

  /// A template for the API URL to get information about Git commits of the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/git/commits{/sha}'`
  final String gitCommitsUrl;

  /// A template for the API URL to get information about Git refs of the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/git/refs{/sha}'`
  final String gitRefsUrl;

  /// A template for the API URL to get information about Git tags of the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/git/tags{/sha}'`
  final String gitTagsUrl;

  /// A template for the API URL to get information about issue comments on
  /// the repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/issues/comments{/number}'`
  final String issueCommentUrl;

  /// A template for the API URL to get information about issue events on the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/issues/events{/number}'`
  final String issueEventsUrl;

  /// A template for the API URL to get information about issues on the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/issues{/number}'`
  final String issuesUrl;

  /// A template for the API URL to get information about deploy keys on the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/keys{/key_id}'`
  final String keysUrl;

  /// A template for the API URL to get information about labels of the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/labels{/name}'`
  final String labelsUrl;

  /// The API URL to get information about the languages of the repository.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/languages'`
  final Uri languagesUrl;

  /// The API URL to merge branches in the repository.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/merges'`
  final Uri mergesUrl;

  /// A template for the API URL to get information about milestones of the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/milestones{/number}'`
  final String milestonesUrl;

  /// A template for the API URL to get information about notifications on the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/notifications{?since,all,participating}'`
  final String notificationsUrl;

  /// A template for the API URL to get information about pull requests on the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/pulls{/number}'`
  final String pullsUrl;

  /// A template for the API URL to get information about releases on the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/releases{/id}'`
  final String releasesUrl;

  /// The API URL to list the stargazers on the repository.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/stargazers'`
  final Uri stargazersUrl;

  /// A template for the API URL to get information about statuses of a
  /// commit.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/statuses/{sha}'`
  final String statusesUrl;

  /// The API URL to list the subscribers on the repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/subscribers'`
  final Uri subscribersUrl;

  /// The API URL to subscribe to notifications for this repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/subscription'`
  final Uri subscriptionUrl;

  /// The API URL to get information about tags on the repository.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/tags'`
  final Uri tagsUrl;

  /// The API URL to list the teams on the repository.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/teams'`
  final Uri teamsUrl;

  /// A template for the API URL to create or retrieve a raw Git tree of the
  /// repository.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/git/trees{/sha}'`
  final String treesUrl;

  /// The API URL to list the hooks on the repository.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/hooks'`
  final Uri hooksUrl;

  /// Converts a [SimpleRepository] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'name': name,
      'full_name': fullName,
      'owner': owner.toJson(),
      'private': private,
      'html_url': htmlUrl.toString(),
      'description': description,
      'fork': fork,
      'url': url.toString(),
      'archive_url': archiveUrl,
      'assignees_url': assigneesUrl,
      'blobs_url': blobsUrl,
      'branches_url': branchesUrl,
      'collaborators_url': collaboratorsUrl,
      'comments_url': commentsUrl,
      'commits_url': commitsUrl,
      'compare_url': compareUrl,
      'contents_url': contentsUrl,
      'contributors_url': contributorsUrl.toString(),
      'deployments_url': deploymentsUrl.toString(),
      'downloads_url': downloadsUrl.toString(),
      'events_url': eventsUrl.toString(),
      'forks_url': forksUrl.toString(),
      'git_commits_url': gitCommitsUrl,
      'git_refs_url': gitRefsUrl,
      'git_tags_url': gitTagsUrl,
      'issue_comment_url': issueCommentUrl,
      'issue_events_url': issueEventsUrl,
      'issues_url': issuesUrl,
      'keys_url': keysUrl,
      'labels_url': labelsUrl,
      'languages_url': languagesUrl.toString(),
      'merges_url': mergesUrl.toString(),
      'milestones_url': milestonesUrl,
      'notifications_url': notificationsUrl,
      'pulls_url': pullsUrl,
      'releases_url': releasesUrl,
      'stargazers_url': stargazersUrl.toString(),
      'statuses_url': statusesUrl,
      'subscribers_url': subscribersUrl.toString(),
      'subscription_url': subscriptionUrl.toString(),
      'tags_url': tagsUrl.toString(),
      'teams_url': teamsUrl.toString(),
      'trees_url': treesUrl,
      'hooks_url': hooksUrl.toString(),
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
    archiveUrl,
    assigneesUrl,
    blobsUrl,
    branchesUrl,
    collaboratorsUrl,
    commentsUrl,
    commitsUrl,
    compareUrl,
    contentsUrl,
    contributorsUrl,
    deploymentsUrl,
    downloadsUrl,
    eventsUrl,
    forksUrl,
    gitCommitsUrl,
    gitRefsUrl,
    gitTagsUrl,
    issueCommentUrl,
    issueEventsUrl,
    issuesUrl,
    keysUrl,
    labelsUrl,
    languagesUrl,
    mergesUrl,
    milestonesUrl,
    notificationsUrl,
    pullsUrl,
    releasesUrl,
    stargazersUrl,
    statusesUrl,
    subscribersUrl,
    subscriptionUrl,
    tagsUrl,
    teamsUrl,
    treesUrl,
    hooksUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SimpleRepository &&
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
        archiveUrl == other.archiveUrl &&
        assigneesUrl == other.assigneesUrl &&
        blobsUrl == other.blobsUrl &&
        branchesUrl == other.branchesUrl &&
        collaboratorsUrl == other.collaboratorsUrl &&
        commentsUrl == other.commentsUrl &&
        commitsUrl == other.commitsUrl &&
        compareUrl == other.compareUrl &&
        contentsUrl == other.contentsUrl &&
        contributorsUrl == other.contributorsUrl &&
        deploymentsUrl == other.deploymentsUrl &&
        downloadsUrl == other.downloadsUrl &&
        eventsUrl == other.eventsUrl &&
        forksUrl == other.forksUrl &&
        gitCommitsUrl == other.gitCommitsUrl &&
        gitRefsUrl == other.gitRefsUrl &&
        gitTagsUrl == other.gitTagsUrl &&
        issueCommentUrl == other.issueCommentUrl &&
        issueEventsUrl == other.issueEventsUrl &&
        issuesUrl == other.issuesUrl &&
        keysUrl == other.keysUrl &&
        labelsUrl == other.labelsUrl &&
        languagesUrl == other.languagesUrl &&
        mergesUrl == other.mergesUrl &&
        milestonesUrl == other.milestonesUrl &&
        notificationsUrl == other.notificationsUrl &&
        pullsUrl == other.pullsUrl &&
        releasesUrl == other.releasesUrl &&
        stargazersUrl == other.stargazersUrl &&
        statusesUrl == other.statusesUrl &&
        subscribersUrl == other.subscribersUrl &&
        subscriptionUrl == other.subscriptionUrl &&
        tagsUrl == other.tagsUrl &&
        teamsUrl == other.teamsUrl &&
        treesUrl == other.treesUrl &&
        hooksUrl == other.hooksUrl;
  }
}
