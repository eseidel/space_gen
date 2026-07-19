import 'package:github/model_helpers.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:meta/meta.dart';

/// {@template review_requested_issue_event}
/// Review Requested Issue Event
/// Review Requested Issue Event
/// {@endtemplate}
@immutable
class ReviewRequestedIssueEvent {
  /// {@macro review_requested_issue_event}
  const ReviewRequestedIssueEvent({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.actor,
    required this.event,
    required this.commitId,
    required this.commitUrl,
    required this.createdAt,
    required this.performedViaGithubApp,
    required this.reviewRequester,
    this.requestedTeam,
    this.requestedReviewer,
  });

  /// Converts a `Map<String, dynamic>` to a [ReviewRequestedIssueEvent].
  factory ReviewRequestedIssueEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReviewRequestedIssueEvent',
      json,
      () => ReviewRequestedIssueEvent(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        url: json['url'] as String,
        actor: SimpleUser.fromJson(json['actor'] as Map<String, dynamic>),
        event: json['event'] as String,
        commitId: checkedKey(json, 'commit_id') as String?,
        commitUrl: checkedKey(json, 'commit_url') as String?,
        createdAt: json['created_at'] as String,
        performedViaGithubApp: Integration.maybeFromJson(
          checkedKey(json, 'performed_via_github_app') as Map<String, dynamic>?,
        ),
        reviewRequester: SimpleUser.fromJson(
          json['review_requester'] as Map<String, dynamic>,
        ),
        requestedTeam: Team.maybeFromJson(
          json['requested_team'] as Map<String, dynamic>?,
        ),
        requestedReviewer: SimpleUser.maybeFromJson(
          json['requested_reviewer'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReviewRequestedIssueEvent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReviewRequestedIssueEvent.fromJson(json);
  }

  final int id;
  final String nodeId;
  final String url;

  /// Simple User
  /// A GitHub user.
  final SimpleUser actor;
  final String event;
  final String? commitId;
  final String? commitUrl;
  final String createdAt;

  /// GitHub app
  /// GitHub apps are a new way to extend GitHub. They can be installed
  /// directly on organizations and user accounts and granted access to
  /// specific repositories. They come with granular permissions and built-in
  /// webhooks. GitHub apps are first class actors within GitHub.
  final Integration? performedViaGithubApp;

  /// Simple User
  /// A GitHub user.
  final SimpleUser reviewRequester;

  /// Team
  /// Groups of organization members that gives permissions on specified
  /// repositories.
  final Team? requestedTeam;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? requestedReviewer;

  /// Converts a [ReviewRequestedIssueEvent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'url': url,
      'actor': actor.toJson(),
      'event': event,
      'commit_id': commitId,
      'commit_url': commitUrl,
      'created_at': createdAt,
      'performed_via_github_app': performedViaGithubApp?.toJson(),
      'review_requester': reviewRequester.toJson(),
      'requested_team': requestedTeam?.toJson(),
      'requested_reviewer': requestedReviewer?.toJson(),
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
    performedViaGithubApp,
    reviewRequester,
    requestedTeam,
    requestedReviewer,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReviewRequestedIssueEvent &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        actor == other.actor &&
        event == other.event &&
        commitId == other.commitId &&
        commitUrl == other.commitUrl &&
        createdAt == other.createdAt &&
        performedViaGithubApp == other.performedViaGithubApp &&
        reviewRequester == other.reviewRequester &&
        requestedTeam == other.requestedTeam &&
        requestedReviewer == other.requestedReviewer;
  }
}
