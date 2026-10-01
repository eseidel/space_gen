// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
