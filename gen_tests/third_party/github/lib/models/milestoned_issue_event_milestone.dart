import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MilestonedIssueEventMilestone {
  const MilestonedIssueEventMilestone({required this.title});

  /// Converts a `Map<String, dynamic>` to a [MilestonedIssueEventMilestone].
  factory MilestonedIssueEventMilestone.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MilestonedIssueEventMilestone',
      json,
      () => MilestonedIssueEventMilestone(title: json['title'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MilestonedIssueEventMilestone? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MilestonedIssueEventMilestone.fromJson(json);
  }

  final String title;

  /// Converts a [MilestonedIssueEventMilestone] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'title': title};
  }

  @override
  int get hashCode => title.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MilestonedIssueEventMilestone && title == other.title;
  }
}
