import 'package:github/model_helpers.dart';
import 'package:github/models/workflow_usage_billable_macos.dart';
import 'package:github/models/workflow_usage_billable_ubuntu.dart';
import 'package:github/models/workflow_usage_billable_windows.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowUsageBillable {
  const WorkflowUsageBillable({this.ubuntu, this.macos, this.windows});

  /// Converts a `Map<String, dynamic>` to a [WorkflowUsageBillable].
  factory WorkflowUsageBillable.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowUsageBillable',
      json,
      () => WorkflowUsageBillable(
        ubuntu: WorkflowUsageBillableUbuntu.maybeFromJson(
          json['UBUNTU'] as Map<String, dynamic>?,
        ),
        macos: WorkflowUsageBillableMacos.maybeFromJson(
          json['MACOS'] as Map<String, dynamic>?,
        ),
        windows: WorkflowUsageBillableWindows.maybeFromJson(
          json['WINDOWS'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowUsageBillable? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WorkflowUsageBillable.fromJson(json);
  }

  final WorkflowUsageBillableUbuntu? ubuntu;
  final WorkflowUsageBillableMacos? macos;
  final WorkflowUsageBillableWindows? windows;

  /// Converts a [WorkflowUsageBillable] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'UBUNTU': ubuntu?.toJson(),
      'MACOS': macos?.toJson(),
      'WINDOWS': windows?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([ubuntu, macos, windows]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowUsageBillable &&
        ubuntu == other.ubuntu &&
        macos == other.macos &&
        windows == other.windows;
  }
}
