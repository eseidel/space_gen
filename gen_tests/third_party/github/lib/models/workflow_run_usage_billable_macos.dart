import 'package:github/model_helpers.dart';
import 'package:github/models/workflow_run_usage_billable_macos_job_runs_inner.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowRunUsageBillableMacos {
  const WorkflowRunUsageBillableMacos({
    required this.totalMs,
    required this.jobs,
    this.jobRuns,
  });

  /// Converts a `Map<String, dynamic>` to a [WorkflowRunUsageBillableMacos].
  factory WorkflowRunUsageBillableMacos.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowRunUsageBillableMacos',
      json,
      () => WorkflowRunUsageBillableMacos(
        totalMs: json['total_ms'] as int,
        jobs: json['jobs'] as int,
        jobRuns: (json['job_runs'] as List?)
            ?.map<WorkflowRunUsageBillableMacosJobRunsInner>(
              (e) => WorkflowRunUsageBillableMacosJobRunsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowRunUsageBillableMacos? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return WorkflowRunUsageBillableMacos.fromJson(json);
  }

  final int totalMs;
  final int jobs;
  final List<WorkflowRunUsageBillableMacosJobRunsInner>? jobRuns;

  /// Converts a [WorkflowRunUsageBillableMacos] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_ms': totalMs,
      'jobs': jobs,
      'job_runs': ?jobRuns?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalMs, jobs, listHash(jobRuns)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowRunUsageBillableMacos &&
        totalMs == other.totalMs &&
        jobs == other.jobs &&
        listsEqual(jobRuns, other.jobRuns);
  }
}
