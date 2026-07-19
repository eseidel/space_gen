import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesReprioritizeSubIssueRequest {
  const IssuesReprioritizeSubIssueRequest({
    required this.subIssueId,
    this.afterId,
    this.beforeId,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [IssuesReprioritizeSubIssueRequest].
  factory IssuesReprioritizeSubIssueRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'IssuesReprioritizeSubIssueRequest',
      json,
      () => IssuesReprioritizeSubIssueRequest(
        subIssueId: json['sub_issue_id'] as int,
        afterId: json['after_id'] as int?,
        beforeId: json['before_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesReprioritizeSubIssueRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesReprioritizeSubIssueRequest.fromJson(json);
  }

  /// The id of the sub-issue to reprioritize
  final int subIssueId;

  /// The id of the sub-issue to be prioritized after (either positional
  /// argument after OR before should be specified).
  final int? afterId;

  /// The id of the sub-issue to be prioritized before (either positional
  /// argument after OR before should be specified).
  final int? beforeId;

  /// Converts an [IssuesReprioritizeSubIssueRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'sub_issue_id': subIssueId,
      'after_id': ?afterId,
      'before_id': ?beforeId,
    };
  }

  @override
  int get hashCode => Object.hashAll([subIssueId, afterId, beforeId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesReprioritizeSubIssueRequest &&
        subIssueId == other.subIssueId &&
        afterId == other.afterId &&
        beforeId == other.beforeId;
  }
}
