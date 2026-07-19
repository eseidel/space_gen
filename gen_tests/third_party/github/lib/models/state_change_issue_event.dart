import 'package:github/model_helpers.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template state_change_issue_event}
/// State Change Issue Event
/// State Change Issue Event
/// {@endtemplate}
@immutable
class StateChangeIssueEvent {
  /// {@macro state_change_issue_event}
  const StateChangeIssueEvent({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.actor,
    required this.event,
    required this.commitId,
    required this.commitUrl,
    required this.createdAt,
    required this.performedViaGithubApp,
    this.stateReason,
  });

  /// Converts a `Map<String, dynamic>` to a [StateChangeIssueEvent].
  factory StateChangeIssueEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StateChangeIssueEvent',
      json,
      () => StateChangeIssueEvent(
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
        stateReason: json['state_reason'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StateChangeIssueEvent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return StateChangeIssueEvent.fromJson(json);
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
  final String? stateReason;

  /// Converts a [StateChangeIssueEvent] to a `Map<String, dynamic>`.
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
      'state_reason': stateReason,
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
    stateReason,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StateChangeIssueEvent &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        actor == other.actor &&
        event == other.event &&
        commitId == other.commitId &&
        commitUrl == other.commitUrl &&
        createdAt == other.createdAt &&
        performedViaGithubApp == other.performedViaGithubApp &&
        stateReason == other.stateReason;
  }
}
