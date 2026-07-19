// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/author_association.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/issue.dart';
import 'package:github/models/issue_event_dismissed_review.dart';
import 'package:github/models/issue_event_label.dart';
import 'package:github/models/issue_event_milestone.dart';
import 'package:github/models/issue_event_project_card.dart';
import 'package:github/models/issue_event_rename.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

/// {@template issue_event}
/// Issue Event
/// Issue Event
/// {@endtemplate}
@immutable
class IssueEvent {
  /// {@macro issue_event}
  const IssueEvent({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.actor,
    required this.event,
    required this.commitId,
    required this.commitUrl,
    required this.createdAt,
    this.issue,
    this.label,
    this.assignee,
    this.assigner,
    this.reviewRequester,
    this.requestedReviewer,
    this.requestedTeam,
    this.dismissedReview,
    this.milestone,
    this.projectCard,
    this.rename,
    this.authorAssociation,
    this.lockReason,
    this.performedViaGithubApp,
  });

  /// Converts a `Map<String, dynamic>` to an [IssueEvent].
  factory IssueEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssueEvent',
      json,
      () => IssueEvent(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        actor: SimpleUser.maybeFromJson(
          checkedKey(json, 'actor') as Map<String, dynamic>?,
        ),
        event: json['event'] as String,
        commitId: checkedKey(json, 'commit_id') as String?,
        commitUrl: checkedKey(json, 'commit_url') as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        issue: Issue.maybeFromJson(json['issue'] as Map<String, dynamic>?),
        label: IssueEventLabel.maybeFromJson(
          json['label'] as Map<String, dynamic>?,
        ),
        assignee: SimpleUser.maybeFromJson(
          json['assignee'] as Map<String, dynamic>?,
        ),
        assigner: SimpleUser.maybeFromJson(
          json['assigner'] as Map<String, dynamic>?,
        ),
        reviewRequester: SimpleUser.maybeFromJson(
          json['review_requester'] as Map<String, dynamic>?,
        ),
        requestedReviewer: SimpleUser.maybeFromJson(
          json['requested_reviewer'] as Map<String, dynamic>?,
        ),
        requestedTeam: Team.maybeFromJson(
          json['requested_team'] as Map<String, dynamic>?,
        ),
        dismissedReview: IssueEventDismissedReview.maybeFromJson(
          json['dismissed_review'] as Map<String, dynamic>?,
        ),
        milestone: IssueEventMilestone.maybeFromJson(
          json['milestone'] as Map<String, dynamic>?,
        ),
        projectCard: IssueEventProjectCard.maybeFromJson(
          json['project_card'] as Map<String, dynamic>?,
        ),
        rename: IssueEventRename.maybeFromJson(
          json['rename'] as Map<String, dynamic>?,
        ),
        authorAssociation: AuthorAssociation.maybeFromJson(
          json['author_association'] as String?,
        ),
        lockReason: json['lock_reason'] as String?,
        performedViaGithubApp: Integration.maybeFromJson(
          json['performed_via_github_app'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssueEvent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssueEvent.fromJson(json);
  }

  /// Example: `1`
  final int id;

  /// Example: `'MDEwOklzc3VlRXZlbnQx'`
  final String nodeId;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/issues/events/1'`
  final Uri url;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? actor;

  /// Example: `'closed'`
  final String event;

  /// Example: `'6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final String? commitId;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final String? commitUrl;

  /// Example: `'2011-04-14T16:00:49Z'`
  final DateTime createdAt;

  /// Issue
  /// Issues are a great way to keep track of tasks, enhancements, and bugs
  /// for your projects.
  final Issue? issue;

  /// Issue Event Label
  /// Issue Event Label
  final IssueEventLabel? label;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? assignee;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? assigner;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? reviewRequester;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? requestedReviewer;

  /// Team
  /// Groups of organization members that gives permissions on specified
  /// repositories.
  final Team? requestedTeam;

  /// Issue Event Dismissed Review
  final IssueEventDismissedReview? dismissedReview;

  /// Issue Event Milestone
  /// Issue Event Milestone
  final IssueEventMilestone? milestone;

  /// Issue Event Project Card
  /// Issue Event Project Card
  final IssueEventProjectCard? projectCard;

  /// Issue Event Rename
  /// Issue Event Rename
  final IssueEventRename? rename;

  /// author_association
  /// How the author is associated with the repository.
  /// Example: `'OWNER'`
  final AuthorAssociation? authorAssociation;
  final String? lockReason;

  /// GitHub app
  /// GitHub apps are a new way to extend GitHub. They can be installed
  /// directly on organizations and user accounts and granted access to
  /// specific repositories. They come with granular permissions and built-in
  /// webhooks. GitHub apps are first class actors within GitHub.
  final Integration? performedViaGithubApp;

  /// Converts an [IssueEvent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'url': url.toString(),
      'actor': actor?.toJson(),
      'event': event,
      'commit_id': commitId,
      'commit_url': commitUrl,
      'created_at': createdAt.toIso8601String(),
      'issue': issue?.toJson(),
      'label': label?.toJson(),
      'assignee': assignee?.toJson(),
      'assigner': assigner?.toJson(),
      'review_requester': reviewRequester?.toJson(),
      'requested_reviewer': requestedReviewer?.toJson(),
      'requested_team': requestedTeam?.toJson(),
      'dismissed_review': dismissedReview?.toJson(),
      'milestone': milestone?.toJson(),
      'project_card': projectCard?.toJson(),
      'rename': rename?.toJson(),
      'author_association': authorAssociation?.toJson(),
      'lock_reason': lockReason,
      'performed_via_github_app': performedViaGithubApp?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    url,
    actor,
    event,
    commitId,
    commitUrl,
    createdAt,
    issue,
    label,
    assignee,
    assigner,
    reviewRequester,
    requestedReviewer,
    requestedTeam,
    dismissedReview,
    milestone,
    projectCard,
    rename,
    authorAssociation,
    lockReason,
    performedViaGithubApp,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssueEvent &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        actor == other.actor &&
        event == other.event &&
        commitId == other.commitId &&
        commitUrl == other.commitUrl &&
        createdAt == other.createdAt &&
        issue == other.issue &&
        label == other.label &&
        assignee == other.assignee &&
        assigner == other.assigner &&
        reviewRequester == other.reviewRequester &&
        requestedReviewer == other.requestedReviewer &&
        requestedTeam == other.requestedTeam &&
        dismissedReview == other.dismissedReview &&
        milestone == other.milestone &&
        projectCard == other.projectCard &&
        rename == other.rename &&
        authorAssociation == other.authorAssociation &&
        lockReason == other.lockReason &&
        performedViaGithubApp == other.performedViaGithubApp;
  }
}
