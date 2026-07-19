import 'package:github/model_helpers.dart';
import 'package:github/models/commit_comment.dart';
import 'package:meta/meta.dart';

/// {@template timeline_commit_commented_event}
/// Timeline Commit Commented Event
/// Timeline Commit Commented Event
/// {@endtemplate}
@immutable
class TimelineCommitCommentedEvent {
  /// {@macro timeline_commit_commented_event}
  const TimelineCommitCommentedEvent({
    this.event,
    this.nodeId,
    this.commitId,
    this.comments,
  });

  /// Converts a `Map<String, dynamic>` to a [TimelineCommitCommentedEvent].
  factory TimelineCommitCommentedEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TimelineCommitCommentedEvent',
      json,
      () => TimelineCommitCommentedEvent(
        event: json['event'] as String?,
        nodeId: json['node_id'] as String?,
        commitId: json['commit_id'] as String?,
        comments: (json['comments'] as List?)
            ?.map<CommitComment>(
              (e) => CommitComment.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineCommitCommentedEvent? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TimelineCommitCommentedEvent.fromJson(json);
  }

  final String? event;
  final String? nodeId;
  final String? commitId;
  final List<CommitComment>? comments;

  /// Converts a [TimelineCommitCommentedEvent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'event': ?event,
      'node_id': ?nodeId,
      'commit_id': ?commitId,
      'comments': ?comments?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([event, nodeId, commitId, listHash(comments)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineCommitCommentedEvent &&
        event == other.event &&
        nodeId == other.nodeId &&
        commitId == other.commitId &&
        listsEqual(comments, other.comments);
  }
}
