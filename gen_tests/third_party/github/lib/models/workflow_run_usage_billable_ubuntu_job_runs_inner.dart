import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowRunUsageBillableUbuntuJobRunsInner {
  const WorkflowRunUsageBillableUbuntuJobRunsInner({
    required this.jobId,
    required this.durationMs,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [WorkflowRunUsageBillableUbuntuJobRunsInner].
  factory WorkflowRunUsageBillableUbuntuJobRunsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'WorkflowRunUsageBillableUbuntuJobRunsInner',
      json,
      () => WorkflowRunUsageBillableUbuntuJobRunsInner(
        jobId: json['job_id'] as int,
        durationMs: json['duration_ms'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowRunUsageBillableUbuntuJobRunsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return WorkflowRunUsageBillableUbuntuJobRunsInner.fromJson(json);
  }

  final int jobId;
  final int durationMs;

  /// Converts a [WorkflowRunUsageBillableUbuntuJobRunsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'job_id': jobId, 'duration_ms': durationMs};
  }

  @override
  int get hashCode => Object.hashAll([jobId, durationMs]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowRunUsageBillableUbuntuJobRunsInner &&
        jobId == other.jobId &&
        durationMs == other.durationMs;
  }
}
