import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class DemilestonedIssueEventMilestone {
  const DemilestonedIssueEventMilestone({required this.title});

  /// Converts a `Map<String, dynamic>` to a [DemilestonedIssueEventMilestone].
  factory DemilestonedIssueEventMilestone.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DemilestonedIssueEventMilestone',
      json,
      () => DemilestonedIssueEventMilestone(title: json['title'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DemilestonedIssueEventMilestone? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DemilestonedIssueEventMilestone.fromJson(json);
  }

  final String title;

  /// Converts a [DemilestonedIssueEventMilestone] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'title': title};
  }

  @override
  int get hashCode => title.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DemilestonedIssueEventMilestone && title == other.title;
  }
}
