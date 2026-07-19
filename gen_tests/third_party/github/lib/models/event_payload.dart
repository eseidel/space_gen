import 'package:github/model_helpers.dart';
import 'package:github/models/event_payload_pages_inner.dart';
import 'package:github/models/issue.dart';
import 'package:github/models/issue_comment.dart';
import 'package:meta/meta.dart';

@immutable
class EventPayload {
  const EventPayload({this.action, this.issue, this.comment, this.pages});

  /// Converts a `Map<String, dynamic>` to an [EventPayload].
  factory EventPayload.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EventPayload',
      json,
      () => EventPayload(
        action: json['action'] as String?,
        issue: Issue.maybeFromJson(json['issue'] as Map<String, dynamic>?),
        comment: IssueComment.maybeFromJson(
          json['comment'] as Map<String, dynamic>?,
        ),
        pages: (json['pages'] as List?)
            ?.map<EventPayloadPagesInner>(
              (e) => EventPayloadPagesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EventPayload? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EventPayload.fromJson(json);
  }

  final String? action;

  /// Issue
  /// Issues are a great way to keep track of tasks, enhancements, and bugs
  /// for your projects.
  final Issue? issue;

  /// Issue Comment
  /// Comments provide a way for people to collaborate on an issue.
  final IssueComment? comment;
  final List<EventPayloadPagesInner>? pages;

  /// Converts an [EventPayload] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'action': action,
      'issue': issue?.toJson(),
      'comment': comment?.toJson(),
      'pages': pages?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([action, issue, comment, listHash(pages)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EventPayload &&
        action == other.action &&
        issue == other.issue &&
        comment == other.comment &&
        listsEqual(pages, other.pages);
  }
}
