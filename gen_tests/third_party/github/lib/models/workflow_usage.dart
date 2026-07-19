import 'package:github/model_helpers.dart';
import 'package:github/models/workflow_usage_billable.dart';
import 'package:meta/meta.dart';

/// {@template workflow_usage}
/// Workflow Usage
/// Workflow Usage
/// {@endtemplate}
@immutable
class WorkflowUsage {
  /// {@macro workflow_usage}
  const WorkflowUsage({required this.billable});

  /// Converts a `Map<String, dynamic>` to a [WorkflowUsage].
  factory WorkflowUsage.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowUsage',
      json,
      () => WorkflowUsage(
        billable: WorkflowUsageBillable.fromJson(
          json['billable'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowUsage? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WorkflowUsage.fromJson(json);
  }

  final WorkflowUsageBillable billable;

  /// Converts a [WorkflowUsage] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'billable': billable.toJson()};
  }

  @override
  int get hashCode => billable.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowUsage && billable == other.billable;
  }
}
