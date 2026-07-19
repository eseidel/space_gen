// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/author_association.dart';
import 'package:github/models/auto_merge.dart';
import 'package:github/models/milestone.dart';
import 'package:github/models/pull_request_simple_base.dart';
import 'package:github/models/pull_request_simple_head.dart';
import 'package:github/models/pull_request_simple_labels_inner.dart';
import 'package:github/models/pull_request_simple_links.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

/// {@template pull_request_simple}
/// Pull Request Simple
/// Pull Request Simple
/// {@endtemplate}
@immutable
class PullRequestSimple {
  /// {@macro pull_request_simple}
  const PullRequestSimple({
    required this.url,
    required this.id,
    required this.nodeId,
    required this.htmlUrl,
    required this.diffUrl,
    required this.patchUrl,
    required this.issueUrl,
    required this.commitsUrl,
    required this.reviewCommentsUrl,
    required this.reviewCommentUrl,
    required this.commentsUrl,
    required this.statusesUrl,
    required this.number,
    required this.state,
    required this.locked,
    required this.title,
    required this.user,
    required this.body,
    required this.labels,
    required this.milestone,
    required this.createdAt,
    required this.updatedAt,
    required this.closedAt,
    required this.mergedAt,
    required this.mergeCommitSha,
    required this.assignee,
    required this.head,
    required this.base,
    required this.links,
    required this.authorAssociation,
    required this.autoMerge,
    this.activeLockReason,
    this.assignees,
    this.requestedReviewers,
    this.requestedTeams,
    this.draft,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestSimple].
  factory PullRequestSimple.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestSimple',
      json,
      () => PullRequestSimple(
        url: Uri.parse(json['url'] as String),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        diffUrl: Uri.parse(json['diff_url'] as String),
        patchUrl: Uri.parse(json['patch_url'] as String),
        issueUrl: Uri.parse(json['issue_url'] as String),
        commitsUrl: Uri.parse(json['commits_url'] as String),
        reviewCommentsUrl: Uri.parse(json['review_comments_url'] as String),
        reviewCommentUrl: json['review_comment_url'] as String,
        commentsUrl: Uri.parse(json['comments_url'] as String),
        statusesUrl: Uri.parse(json['statuses_url'] as String),
        number: json['number'] as int,
        state: json['state'] as String,
        locked: json['locked'] as bool,
        title: json['title'] as String,
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
        body: checkedKey(json, 'body') as String?,
        labels: (json['labels'] as List)
            .map<PullRequestSimpleLabelsInner>(
              (e) => PullRequestSimpleLabelsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        milestone: Milestone.maybeFromJson(
          checkedKey(json, 'milestone') as Map<String, dynamic>?,
        ),
        activeLockReason: json['active_lock_reason'] as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        closedAt: maybeParseDateTime(checkedKey(json, 'closed_at') as String?),
        mergedAt: maybeParseDateTime(checkedKey(json, 'merged_at') as String?),
        mergeCommitSha: checkedKey(json, 'merge_commit_sha') as String?,
        assignee: SimpleUser.maybeFromJson(
          checkedKey(json, 'assignee') as Map<String, dynamic>?,
        ),
        assignees: (json['assignees'] as List?)
            ?.map<SimpleUser>(
              (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        requestedReviewers: (json['requested_reviewers'] as List?)
            ?.map<SimpleUser>(
              (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        requestedTeams: (json['requested_teams'] as List?)
            ?.map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
            .toList(),
        head: PullRequestSimpleHead.fromJson(
          json['head'] as Map<String, dynamic>,
        ),
        base: PullRequestSimpleBase.fromJson(
          json['base'] as Map<String, dynamic>,
        ),
        links: PullRequestSimpleLinks.fromJson(
          json['_links'] as Map<String, dynamic>,
        ),
        authorAssociation: AuthorAssociation.fromJson(
          json['author_association'] as String,
        ),
        autoMerge: AutoMerge.maybeFromJson(
          checkedKey(json, 'auto_merge') as Map<String, dynamic>?,
        ),
        draft: json['draft'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestSimple? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestSimple.fromJson(json);
  }

  /// Example: `'https://api.github.com/repos/octocat/Hello-World/pulls/1347'`
  final Uri url;

  /// Example: `1`
  final int id;

  /// Example: `'MDExOlB1bGxSZXF1ZXN0MQ=='`
  final String nodeId;

  /// Example: `'https://github.com/octocat/Hello-World/pull/1347'`
  final Uri htmlUrl;

  /// Example: `'https://github.com/octocat/Hello-World/pull/1347.diff'`
  final Uri diffUrl;

  /// Example: `'https://github.com/octocat/Hello-World/pull/1347.patch'`
  final Uri patchUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/issues/1347'`
  final Uri issueUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/pulls/1347/commits'`
  final Uri commitsUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/pulls/1347/comments'`
  final Uri reviewCommentsUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/pulls/comments{/number}'`
  final String reviewCommentUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/issues/1347/comments'`
  final Uri commentsUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/statuses/6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final Uri statusesUrl;

  /// Example: `1347`
  final int number;

  /// Example: `'open'`
  final String state;

  /// Example: `true`
  final bool locked;

  /// Example: `'new-feature'`
  final String title;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;

  /// Example: `'Please pull these awesome changes'`
  final String? body;
  final List<PullRequestSimpleLabelsInner> labels;

  /// Milestone
  /// A collection of related issues and pull requests.
  final Milestone? milestone;

  /// Example: `'too heated'`
  final String? activeLockReason;

  /// Example: `'2011-01-26T19:01:12Z'`
  final DateTime createdAt;

  /// Example: `'2011-01-26T19:01:12Z'`
  final DateTime updatedAt;

  /// Example: `'2011-01-26T19:01:12Z'`
  final DateTime? closedAt;

  /// Example: `'2011-01-26T19:01:12Z'`
  final DateTime? mergedAt;

  /// Example: `'e5bd3914e2e596debea16f433f57875b5b90bcd6'`
  final String? mergeCommitSha;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? assignee;
  final List<SimpleUser>? assignees;
  final List<SimpleUser>? requestedReviewers;
  final List<Team>? requestedTeams;
  final PullRequestSimpleHead head;
  final PullRequestSimpleBase base;
  final PullRequestSimpleLinks links;

  /// author_association
  /// How the author is associated with the repository.
  /// Example: `'OWNER'`
  final AuthorAssociation authorAssociation;

  /// Auto merge
  /// The status of auto merging a pull request.
  final AutoMerge? autoMerge;

  /// Indicates whether or not the pull request is a draft.
  /// Example: `false`
  final bool? draft;

  /// Converts a [PullRequestSimple] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'id': id,
      'node_id': nodeId,
      'html_url': htmlUrl.toString(),
      'diff_url': diffUrl.toString(),
      'patch_url': patchUrl.toString(),
      'issue_url': issueUrl.toString(),
      'commits_url': commitsUrl.toString(),
      'review_comments_url': reviewCommentsUrl.toString(),
      'review_comment_url': reviewCommentUrl,
      'comments_url': commentsUrl.toString(),
      'statuses_url': statusesUrl.toString(),
      'number': number,
      'state': state,
      'locked': locked,
      'title': title,
      'user': user?.toJson(),
      'body': body,
      'labels': labels.map((e) => e.toJson()).toList(),
      'milestone': milestone?.toJson(),
      'active_lock_reason': activeLockReason,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'closed_at': closedAt?.toIso8601String(),
      'merged_at': mergedAt?.toIso8601String(),
      'merge_commit_sha': mergeCommitSha,
      'assignee': assignee?.toJson(),
      'assignees': assignees?.map((e) => e.toJson()).toList(),
      'requested_reviewers': requestedReviewers
          ?.map((e) => e.toJson())
          .toList(),
      'requested_teams': requestedTeams?.map((e) => e.toJson()).toList(),
      'head': head.toJson(),
      'base': base.toJson(),
      '_links': links.toJson(),
      'author_association': authorAssociation.toJson(),
      'auto_merge': autoMerge?.toJson(),
      'draft': draft,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    id,
    nodeId,
    htmlUrl,
    diffUrl,
    patchUrl,
    issueUrl,
    commitsUrl,
    reviewCommentsUrl,
    reviewCommentUrl,
    commentsUrl,
    statusesUrl,
    number,
    state,
    locked,
    title,
    user,
    body,
    listHash(labels),
    milestone,
    activeLockReason,
    createdAt,
    updatedAt,
    closedAt,
    mergedAt,
    mergeCommitSha,
    assignee,
    listHash(assignees),
    listHash(requestedReviewers),
    listHash(requestedTeams),
    head,
    base,
    links,
    authorAssociation,
    autoMerge,
    draft,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestSimple &&
        url == other.url &&
        id == other.id &&
        nodeId == other.nodeId &&
        htmlUrl == other.htmlUrl &&
        diffUrl == other.diffUrl &&
        patchUrl == other.patchUrl &&
        issueUrl == other.issueUrl &&
        commitsUrl == other.commitsUrl &&
        reviewCommentsUrl == other.reviewCommentsUrl &&
        reviewCommentUrl == other.reviewCommentUrl &&
        commentsUrl == other.commentsUrl &&
        statusesUrl == other.statusesUrl &&
        number == other.number &&
        state == other.state &&
        locked == other.locked &&
        title == other.title &&
        user == other.user &&
        body == other.body &&
        listsEqual(labels, other.labels) &&
        milestone == other.milestone &&
        activeLockReason == other.activeLockReason &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        closedAt == other.closedAt &&
        mergedAt == other.mergedAt &&
        mergeCommitSha == other.mergeCommitSha &&
        assignee == other.assignee &&
        listsEqual(assignees, other.assignees) &&
        listsEqual(requestedReviewers, other.requestedReviewers) &&
        listsEqual(requestedTeams, other.requestedTeams) &&
        head == other.head &&
        base == other.base &&
        links == other.links &&
        authorAssociation == other.authorAssociation &&
        autoMerge == other.autoMerge &&
        draft == other.draft;
  }
}
