import 'package:github/model_helpers.dart';
import 'package:github/models/timeline_committed_event_author.dart';
import 'package:github/models/timeline_committed_event_committer.dart';
import 'package:github/models/timeline_committed_event_parents_inner.dart';
import 'package:github/models/timeline_committed_event_tree.dart';
import 'package:github/models/timeline_committed_event_verification.dart';
import 'package:meta/meta.dart';

/// {@template timeline_committed_event}
/// Timeline Committed Event
/// Timeline Committed Event
/// {@endtemplate}
@immutable
class TimelineCommittedEvent {
  /// {@macro timeline_committed_event}
  const TimelineCommittedEvent({
    required this.sha,
    required this.nodeId,
    required this.url,
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.parents,
    required this.verification,
    required this.htmlUrl,
    this.event,
  });

  /// Converts a `Map<String, dynamic>` to a [TimelineCommittedEvent].
  factory TimelineCommittedEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TimelineCommittedEvent',
      json,
      () => TimelineCommittedEvent(
        event: json['event'] as String?,
        sha: json['sha'] as String,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        author: TimelineCommittedEventAuthor.fromJson(
          json['author'] as Map<String, dynamic>,
        ),
        committer: TimelineCommittedEventCommitter.fromJson(
          json['committer'] as Map<String, dynamic>,
        ),
        message: json['message'] as String,
        tree: TimelineCommittedEventTree.fromJson(
          json['tree'] as Map<String, dynamic>,
        ),
        parents: (json['parents'] as List)
            .map<TimelineCommittedEventParentsInner>(
              (e) => TimelineCommittedEventParentsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        verification: TimelineCommittedEventVerification.fromJson(
          json['verification'] as Map<String, dynamic>,
        ),
        htmlUrl: Uri.parse(json['html_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineCommittedEvent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TimelineCommittedEvent.fromJson(json);
  }

  final String? event;

  /// SHA for the commit
  /// Example: `'7638417db6d59f3c431d3e1f261cc637155684cd'`
  final String sha;
  final String nodeId;
  final Uri url;

  /// Identifying information for the git-user
  final TimelineCommittedEventAuthor author;

  /// Identifying information for the git-user
  final TimelineCommittedEventCommitter committer;

  /// Message describing the purpose of the commit
  /// Example: `'Fix #42'`
  final String message;
  final TimelineCommittedEventTree tree;
  final List<TimelineCommittedEventParentsInner> parents;
  final TimelineCommittedEventVerification verification;
  final Uri htmlUrl;

  /// Converts a [TimelineCommittedEvent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'sha': sha,
      'node_id': nodeId,
      'url': url.toString(),
      'author': author.toJson(),
      'committer': committer.toJson(),
      'message': message,
      'tree': tree.toJson(),
      'parents': parents.map((e) => e.toJson()).toList(),
      'verification': verification.toJson(),
      'html_url': htmlUrl.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    event,
    sha,
    nodeId,
    url,
    author,
    committer,
    message,
    tree,
    listHash(parents),
    verification,
    htmlUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineCommittedEvent &&
        event == other.event &&
        sha == other.sha &&
        nodeId == other.nodeId &&
        url == other.url &&
        author == other.author &&
        committer == other.committer &&
        message == other.message &&
        tree == other.tree &&
        listsEqual(parents, other.parents) &&
        verification == other.verification &&
        htmlUrl == other.htmlUrl;
  }
}
