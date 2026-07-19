import 'package:github/model_helpers.dart';
import 'package:github/models/workflow_run.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListWorkflowRunsForRepo200Response {
  const ActionsListWorkflowRunsForRepo200Response({
    required this.totalCount,
    required this.workflowRuns,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListWorkflowRunsForRepo200Response].
  factory ActionsListWorkflowRunsForRepo200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListWorkflowRunsForRepo200Response',
      json,
      () => ActionsListWorkflowRunsForRepo200Response(
        totalCount: json['total_count'] as int,
        workflowRuns: (json['workflow_runs'] as List)
            .map<WorkflowRun>(
              (e) => WorkflowRun.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListWorkflowRunsForRepo200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListWorkflowRunsForRepo200Response.fromJson(json);
  }

  final int totalCount;
  final List<WorkflowRun> workflowRuns;

  /// Converts an [ActionsListWorkflowRunsForRepo200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'workflow_runs': workflowRuns.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(workflowRuns)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsListWorkflowRunsForRepo200Response &&
        totalCount == other.totalCount &&
        listsEqual(workflowRuns, other.workflowRuns);
  }
}
