// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesRemoveSubIssueRequest {
  const IssuesRemoveSubIssueRequest({required this.subIssueId});

  /// Converts a `Map<String, dynamic>` to an [IssuesRemoveSubIssueRequest].
  factory IssuesRemoveSubIssueRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesRemoveSubIssueRequest',
      json,
      () =>
          IssuesRemoveSubIssueRequest(subIssueId: json['sub_issue_id'] as int),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesRemoveSubIssueRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesRemoveSubIssueRequest.fromJson(json);
  }

  /// The id of the sub-issue to remove
  final int subIssueId;

  /// Converts an [IssuesRemoveSubIssueRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sub_issue_id': subIssueId};
  }

  @override
  int get hashCode => subIssueId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesRemoveSubIssueRequest &&
        subIssueId == other.subIssueId;
  }
}
