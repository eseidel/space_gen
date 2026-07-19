import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowUsageBillableMacos {
  const WorkflowUsageBillableMacos({this.totalMs});

  /// Converts a `Map<String, dynamic>` to a [WorkflowUsageBillableMacos].
  factory WorkflowUsageBillableMacos.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowUsageBillableMacos',
      json,
      () => WorkflowUsageBillableMacos(totalMs: json['total_ms'] as int?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowUsageBillableMacos? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WorkflowUsageBillableMacos.fromJson(json);
  }

  final int? totalMs;

  /// Converts a [WorkflowUsageBillableMacos] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'total_ms': totalMs};
  }

  @override
  int get hashCode => totalMs.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowUsageBillableMacos && totalMs == other.totalMs;
  }
}
