import 'package:github/model_helpers.dart';
import 'package:github/models/workflow_run_usage_billable.dart';
import 'package:meta/meta.dart';

/// {@template workflow_run_usage}
/// Workflow Run Usage
/// Workflow Run Usage
/// {@endtemplate}
@immutable
class WorkflowRunUsage {
  /// {@macro workflow_run_usage}
  const WorkflowRunUsage({required this.billable, this.runDurationMs});

  /// Converts a `Map<String, dynamic>` to a [WorkflowRunUsage].
  factory WorkflowRunUsage.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowRunUsage',
      json,
      () => WorkflowRunUsage(
        billable: WorkflowRunUsageBillable.fromJson(
          json['billable'] as Map<String, dynamic>,
        ),
        runDurationMs: json['run_duration_ms'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowRunUsage? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WorkflowRunUsage.fromJson(json);
  }

  final WorkflowRunUsageBillable billable;
  final int? runDurationMs;

  /// Converts a [WorkflowRunUsage] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'billable': billable.toJson(), 'run_duration_ms': ?runDurationMs};
  }

  @override
  int get hashCode => Object.hashAll([billable, runDurationMs]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowRunUsage &&
        billable == other.billable &&
        runDurationMs == other.runDurationMs;
  }
}
