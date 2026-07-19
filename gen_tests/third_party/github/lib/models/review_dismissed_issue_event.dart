import 'package:github/model_helpers.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/review_dismissed_issue_event_dismissed_review.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template review_dismissed_issue_event}
/// Review Dismissed Issue Event
/// Review Dismissed Issue Event
/// {@endtemplate}
@immutable
class ReviewDismissedIssueEvent {
  /// {@macro review_dismissed_issue_event}
  const ReviewDismissedIssueEvent({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.actor,
    required this.event,
    required this.commitId,
    required this.commitUrl,
    required this.createdAt,
    required this.performedViaGithubApp,
    required this.dismissedReview,
  });

  /// Converts a `Map<String, dynamic>` to a [ReviewDismissedIssueEvent].
  factory ReviewDismissedIssueEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReviewDismissedIssueEvent',
      json,
      () => ReviewDismissedIssueEvent(
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
        dismissedReview: ReviewDismissedIssueEventDismissedReview.fromJson(
          json['dismissed_review'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReviewDismissedIssueEvent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReviewDismissedIssueEvent.fromJson(json);
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
  final ReviewDismissedIssueEventDismissedReview dismissedReview;

  /// Converts a [ReviewDismissedIssueEvent] to a `Map<String, dynamic>`.
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
      'dismissed_review': dismissedReview.toJson(),
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
    dismissedReview,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReviewDismissedIssueEvent &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        actor == other.actor &&
        event == other.event &&
        commitId == other.commitId &&
        commitUrl == other.commitUrl &&
        createdAt == other.createdAt &&
        performedViaGithubApp == other.performedViaGithubApp &&
        dismissedReview == other.dismissedReview;
  }
}
