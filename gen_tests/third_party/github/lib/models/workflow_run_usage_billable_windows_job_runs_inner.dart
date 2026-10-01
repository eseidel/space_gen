// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowRunUsageBillableWindowsJobRunsInner {
  const WorkflowRunUsageBillableWindowsJobRunsInner({
    required this.jobId,
    required this.durationMs,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [WorkflowRunUsageBillableWindowsJobRunsInner].
  factory WorkflowRunUsageBillableWindowsJobRunsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'WorkflowRunUsageBillableWindowsJobRunsInner',
      json,
      () => WorkflowRunUsageBillableWindowsJobRunsInner(
        jobId: json['job_id'] as int,
        durationMs: json['duration_ms'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowRunUsageBillableWindowsJobRunsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return WorkflowRunUsageBillableWindowsJobRunsInner.fromJson(json);
  }

  final int jobId;
  final int durationMs;

  /// Converts a [WorkflowRunUsageBillableWindowsJobRunsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'job_id': jobId, 'duration_ms': durationMs};
  }

  @override
  int get hashCode => Object.hashAll([jobId, durationMs]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowRunUsageBillableWindowsJobRunsInner &&
        jobId == other.jobId &&
        durationMs == other.durationMs;
  }
}
