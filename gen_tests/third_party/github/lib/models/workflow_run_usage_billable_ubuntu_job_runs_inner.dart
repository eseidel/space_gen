// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
