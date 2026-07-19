import 'package:github/model_helpers.dart';
import 'package:github/models/issues_update_milestone_request_state.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesUpdateMilestoneRequest {
  const IssuesUpdateMilestoneRequest({
    this.title,
    this.state = IssuesUpdateMilestoneRequestState.open,
    this.description,
    this.dueOn,
  });

  /// Converts a `Map<String, dynamic>` to an [IssuesUpdateMilestoneRequest].
  factory IssuesUpdateMilestoneRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesUpdateMilestoneRequest',
      json,
      () => IssuesUpdateMilestoneRequest(
        title: json['title'] as String?,
        state:
            IssuesUpdateMilestoneRequestState.maybeFromJson(
              json['state'] as String?,
            ) ??
            IssuesUpdateMilestoneRequestState.open,
        description: json['description'] as String?,
        dueOn: maybeParseDateTime(json['due_on'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesUpdateMilestoneRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesUpdateMilestoneRequest.fromJson(json);
  }

  /// The title of the milestone.
  final String? title;

  /// The state of the milestone. Either `open` or `closed`.
  final IssuesUpdateMilestoneRequestState state;

  /// A description of the milestone.
  final String? description;

  /// The milestone due date. This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? dueOn;

  /// Converts an [IssuesUpdateMilestoneRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'title': ?title,
      'state': state.toJson(),
      'description': ?description,
      'due_on': ?dueOn?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([title, state, description, dueOn]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesUpdateMilestoneRequest &&
        title == other.title &&
        state == other.state &&
        description == other.description &&
        dueOn == other.dueOn;
  }
}
