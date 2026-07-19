import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template issue_search_result_item_sub_issues_summary}
/// Sub-issues Summary
/// {@endtemplate}
@immutable
class IssueSearchResultItemSubIssuesSummary {
  /// {@macro issue_search_result_item_sub_issues_summary}
  const IssueSearchResultItemSubIssuesSummary({
    required this.total,
    required this.completed,
    required this.percentCompleted,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [IssueSearchResultItemSubIssuesSummary].
  factory IssueSearchResultItemSubIssuesSummary.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'IssueSearchResultItemSubIssuesSummary',
      json,
      () => IssueSearchResultItemSubIssuesSummary(
        total: json['total'] as int,
        completed: json['completed'] as int,
        percentCompleted: json['percent_completed'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssueSearchResultItemSubIssuesSummary? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssueSearchResultItemSubIssuesSummary.fromJson(json);
  }

  final int total;
  final int completed;
  final int percentCompleted;

  /// Converts an [IssueSearchResultItemSubIssuesSummary]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'completed': completed,
      'percent_completed': percentCompleted,
    };
  }

  @override
  int get hashCode => Object.hashAll([total, completed, percentCompleted]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssueSearchResultItemSubIssuesSummary &&
        total == other.total &&
        completed == other.completed &&
        percentCompleted == other.percentCompleted;
  }
}
