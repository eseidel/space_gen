import 'package:github/model_helpers.dart';
import 'package:github/models/workflow_run_usage_billable_ubuntu_job_runs_inner.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowRunUsageBillableUbuntu {
  const WorkflowRunUsageBillableUbuntu({
    required this.totalMs,
    required this.jobs,
    this.jobRuns,
  });

  /// Converts a `Map<String, dynamic>` to a [WorkflowRunUsageBillableUbuntu].
  factory WorkflowRunUsageBillableUbuntu.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowRunUsageBillableUbuntu',
      json,
      () => WorkflowRunUsageBillableUbuntu(
        totalMs: json['total_ms'] as int,
        jobs: json['jobs'] as int,
        jobRuns: (json['job_runs'] as List?)
            ?.map<WorkflowRunUsageBillableUbuntuJobRunsInner>(
              (e) => WorkflowRunUsageBillableUbuntuJobRunsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowRunUsageBillableUbuntu? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return WorkflowRunUsageBillableUbuntu.fromJson(json);
  }

  final int totalMs;
  final int jobs;
  final List<WorkflowRunUsageBillableUbuntuJobRunsInner>? jobRuns;

  /// Converts a [WorkflowRunUsageBillableUbuntu] to a `Map<String, dynamic>`.
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
    return other is WorkflowRunUsageBillableUbuntu &&
        totalMs == other.totalMs &&
        jobs == other.jobs &&
        listsEqual(jobRuns, other.jobRuns);
  }
}
