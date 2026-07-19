import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template issue_event_milestone}
/// Issue Event Milestone
/// Issue Event Milestone
/// {@endtemplate}
@immutable
class IssueEventMilestone {
  /// {@macro issue_event_milestone}
  const IssueEventMilestone({required this.title});

  /// Converts a `Map<String, dynamic>` to an [IssueEventMilestone].
  factory IssueEventMilestone.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssueEventMilestone',
      json,
      () => IssueEventMilestone(title: json['title'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssueEventMilestone? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssueEventMilestone.fromJson(json);
  }

  final String title;

  /// Converts an [IssueEventMilestone] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'title': title};
  }

  @override
  int get hashCode => title.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssueEventMilestone && title == other.title;
  }
}
