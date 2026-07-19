import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowUsageBillableWindows {
  const WorkflowUsageBillableWindows({this.totalMs});

  /// Converts a `Map<String, dynamic>` to a [WorkflowUsageBillableWindows].
  factory WorkflowUsageBillableWindows.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowUsageBillableWindows',
      json,
      () => WorkflowUsageBillableWindows(totalMs: json['total_ms'] as int?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowUsageBillableWindows? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return WorkflowUsageBillableWindows.fromJson(json);
  }

  final int? totalMs;

  /// Converts a [WorkflowUsageBillableWindows] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (totalMs != null) 'total_ms': totalMs};
  }

  @override
  int get hashCode => totalMs.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowUsageBillableWindows && totalMs == other.totalMs;
  }
}
