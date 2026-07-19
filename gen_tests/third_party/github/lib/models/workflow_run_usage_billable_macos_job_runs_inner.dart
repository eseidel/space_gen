import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowRunUsageBillableMacosJobRunsInner {
  const WorkflowRunUsageBillableMacosJobRunsInner({
    required this.jobId,
    required this.durationMs,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [WorkflowRunUsageBillableMacosJobRunsInner].
  factory WorkflowRunUsageBillableMacosJobRunsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'WorkflowRunUsageBillableMacosJobRunsInner',
      json,
      () => WorkflowRunUsageBillableMacosJobRunsInner(
        jobId: json['job_id'] as int,
        durationMs: json['duration_ms'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowRunUsageBillableMacosJobRunsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return WorkflowRunUsageBillableMacosJobRunsInner.fromJson(json);
  }

  final int jobId;
  final int durationMs;

  /// Converts a [WorkflowRunUsageBillableMacosJobRunsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'job_id': jobId, 'duration_ms': durationMs};
  }

  @override
  int get hashCode => Object.hashAll([jobId, durationMs]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowRunUsageBillableMacosJobRunsInner &&
        jobId == other.jobId &&
        durationMs == other.durationMs;
  }
}
