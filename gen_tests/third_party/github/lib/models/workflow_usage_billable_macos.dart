// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
    return {'total_ms': ?totalMs};
  }

  @override
  int get hashCode => totalMs.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowUsageBillableMacos && totalMs == other.totalMs;
  }
}
