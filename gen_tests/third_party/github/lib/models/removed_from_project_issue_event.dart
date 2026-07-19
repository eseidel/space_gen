import 'package:github/model_helpers.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/removed_from_project_issue_event_project_card.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template removed_from_project_issue_event}
/// Removed from Project Issue Event
/// Removed from Project Issue Event
/// {@endtemplate}
@immutable
class RemovedFromProjectIssueEvent {
  /// {@macro removed_from_project_issue_event}
  const RemovedFromProjectIssueEvent({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.actor,
    required this.event,
    required this.commitId,
    required this.commitUrl,
    required this.createdAt,
    required this.performedViaGithubApp,
    this.projectCard,
  });

  /// Converts a `Map<String, dynamic>` to a [RemovedFromProjectIssueEvent].
  factory RemovedFromProjectIssueEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RemovedFromProjectIssueEvent',
      json,
      () => RemovedFromProjectIssueEvent(
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
        projectCard: RemovedFromProjectIssueEventProjectCard.maybeFromJson(
          json['project_card'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RemovedFromProjectIssueEvent? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RemovedFromProjectIssueEvent.fromJson(json);
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
  final RemovedFromProjectIssueEventProjectCard? projectCard;

  /// Converts a [RemovedFromProjectIssueEvent] to a `Map<String, dynamic>`.
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
      'project_card': projectCard?.toJson(),
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
    projectCard,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RemovedFromProjectIssueEvent &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        actor == other.actor &&
        event == other.event &&
        commitId == other.commitId &&
        commitUrl == other.commitUrl &&
        createdAt == other.createdAt &&
        performedViaGithubApp == other.performedViaGithubApp &&
        projectCard == other.projectCard;
  }
}
