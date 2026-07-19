import 'package:github/model_helpers.dart';
import 'package:github/models/workflow_run_usage_billable_windows_job_runs_inner.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowRunUsageBillableWindows {
  const WorkflowRunUsageBillableWindows({
    required this.totalMs,
    required this.jobs,
    this.jobRuns,
  });

  /// Converts a `Map<String, dynamic>` to a [WorkflowRunUsageBillableWindows].
  factory WorkflowRunUsageBillableWindows.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowRunUsageBillableWindows',
      json,
      () => WorkflowRunUsageBillableWindows(
        totalMs: json['total_ms'] as int,
        jobs: json['jobs'] as int,
        jobRuns: (json['job_runs'] as List?)
            ?.map<WorkflowRunUsageBillableWindowsJobRunsInner>(
              (e) => WorkflowRunUsageBillableWindowsJobRunsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowRunUsageBillableWindows? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return WorkflowRunUsageBillableWindows.fromJson(json);
  }

  final int totalMs;
  final int jobs;
  final List<WorkflowRunUsageBillableWindowsJobRunsInner>? jobRuns;

  /// Converts a [WorkflowRunUsageBillableWindows] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_ms': totalMs,
      'jobs': jobs,
      if (jobRuns != null) 'job_runs': jobRuns?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalMs, jobs, listHash(jobRuns)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowRunUsageBillableWindows &&
        totalMs == other.totalMs &&
        jobs == other.jobs &&
        listsEqual(jobRuns, other.jobRuns);
  }
}
