// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowUsageBillableUbuntu {
  const WorkflowUsageBillableUbuntu({this.totalMs});

  /// Converts a `Map<String, dynamic>` to a [WorkflowUsageBillableUbuntu].
  factory WorkflowUsageBillableUbuntu.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowUsageBillableUbuntu',
      json,
      () => WorkflowUsageBillableUbuntu(totalMs: json['total_ms'] as int?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowUsageBillableUbuntu? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return WorkflowUsageBillableUbuntu.fromJson(json);
  }

  final int? totalMs;

  /// Converts a [WorkflowUsageBillableUbuntu] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'total_ms': ?totalMs};
  }

  @override
  int get hashCode => totalMs.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowUsageBillableUbuntu && totalMs == other.totalMs;
  }
}
