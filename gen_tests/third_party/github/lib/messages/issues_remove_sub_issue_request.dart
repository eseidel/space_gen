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
