import 'package:github/model_helpers.dart';
import 'package:github/models/issues_update_request_labels_inner.dart';
import 'package:github/models/issues_update_request_milestone.dart';
import 'package:github/models/issues_update_request_state.dart';
import 'package:github/models/issues_update_request_state_reason.dart';
import 'package:github/models/issues_update_request_title.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesUpdateRequest {
  const IssuesUpdateRequest({
    this.title,
    this.body,
    this.assignee,
    this.state,
    this.stateReason,
    this.milestone,
    this.labels,
    this.assignees,
    this.type,
  });

  /// Converts a `Map<String, dynamic>` to an [IssuesUpdateRequest].
  factory IssuesUpdateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesUpdateRequest',
      json,
      () => IssuesUpdateRequest(
        title: IssuesUpdateRequestTitle.maybeFromJson(
          json['title'] as Map<String, dynamic>?,
        ),
        body: json['body'] as String?,
        assignee: json['assignee'] as String?,
        state: IssuesUpdateRequestState.maybeFromJson(json['state'] as String?),
        stateReason: IssuesUpdateRequestStateReason.maybeFromJson(
          json['state_reason'] as String?,
        ),
        milestone: IssuesUpdateRequestMilestone.maybeFromJson(
          json['milestone'] as Map<String, dynamic>?,
        ),
        labels: (json['labels'] as List?)
            ?.map<IssuesUpdateRequestLabelsInner>(
              (e) => IssuesUpdateRequestLabelsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        assignees: (json['assignees'] as List?)?.cast<String>(),
        type: json['type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesUpdateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssuesUpdateRequest.fromJson(json);
  }

  /// The title of the issue.
  final IssuesUpdateRequestTitle? title;

  /// The contents of the issue.
  final String? body;

  /// Username to assign to this issue. **This field is closing down.**
  final String? assignee;

  /// The open or closed state of the issue.
  final IssuesUpdateRequestState? state;

  /// The reason for the state change. Ignored unless `state` is changed.
  /// Example: `'not_planned'`
  final IssuesUpdateRequestStateReason? stateReason;
  final IssuesUpdateRequestMilestone? milestone;

  /// Labels to associate with this issue. Pass one or more labels to
  /// _replace_ the set of labels on this issue. Send an empty array (`[]`) to
  /// clear all labels from the issue. Only users with push access can set
  /// labels for issues. Without push access to the repository, label changes
  /// are silently dropped.
  final List<IssuesUpdateRequestLabelsInner>? labels;

  /// Usernames to assign to this issue. Pass one or more user logins to
  /// _replace_ the set of assignees on this issue. Send an empty array (`[]`)
  /// to clear all assignees from the issue. Only users with push access can
  /// set assignees for new issues. Without push access to the repository,
  /// assignee changes are silently dropped.
  final List<String>? assignees;

  /// The name of the issue type to associate with this issue or use `null` to
  /// remove the current issue type. Only users with push access can set the
  /// type for issues. Without push access to the repository, type changes are
  /// silently dropped.
  /// Example: `'Epic'`
  final String? type;

  /// Converts an [IssuesUpdateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'title': title?.toJson(),
      'body': body,
      'assignee': assignee,
      'state': state?.toJson(),
      'state_reason': stateReason?.toJson(),
      'milestone': milestone?.toJson(),
      'labels': labels?.map((e) => e.toJson()).toList(),
      'assignees': assignees,
      'type': type,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    title,
    body,
    assignee,
    state,
    stateReason,
    milestone,
    listHash(labels),
    listHash(assignees),
    type,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesUpdateRequest &&
        title == other.title &&
        body == other.body &&
        assignee == other.assignee &&
        state == other.state &&
        stateReason == other.stateReason &&
        milestone == other.milestone &&
        listsEqual(labels, other.labels) &&
        listsEqual(assignees, other.assignees) &&
        type == other.type;
  }
}
