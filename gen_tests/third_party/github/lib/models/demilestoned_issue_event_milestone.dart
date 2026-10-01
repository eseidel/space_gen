// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
