import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesAddSubIssueRequest {
  const IssuesAddSubIssueRequest({
    required this.subIssueId,
    this.replaceParent,
  });

  /// Converts a `Map<String, dynamic>` to an [IssuesAddSubIssueRequest].
  factory IssuesAddSubIssueRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesAddSubIssueRequest',
      json,
      () => IssuesAddSubIssueRequest(
        subIssueId: json['sub_issue_id'] as int,
        replaceParent: json['replace_parent'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesAddSubIssueRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssuesAddSubIssueRequest.fromJson(json);
  }

  /// The id of the sub-issue to add. The sub-issue must belong to the same
  /// repository owner as the parent issue
  final int subIssueId;

  /// Option that, when true, instructs the operation to replace the
  /// sub-issues current parent issue
  final bool? replaceParent;

  /// Converts an [IssuesAddSubIssueRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sub_issue_id': subIssueId, 'replace_parent': replaceParent};
  }

  @override
  int get hashCode => Object.hashAll([subIssueId, replaceParent]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesAddSubIssueRequest &&
        subIssueId == other.subIssueId &&
        replaceParent == other.replaceParent;
  }
}
