import 'package:github/model_helpers.dart';
import 'package:github/models/workflow_run_usage_billable_macos.dart';
import 'package:github/models/workflow_run_usage_billable_ubuntu.dart';
import 'package:github/models/workflow_run_usage_billable_windows.dart';
import 'package:meta/meta.dart';

@immutable
class WorkflowRunUsageBillable {
  const WorkflowRunUsageBillable({this.ubuntu, this.macos, this.windows});

  /// Converts a `Map<String, dynamic>` to a [WorkflowRunUsageBillable].
  factory WorkflowRunUsageBillable.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WorkflowRunUsageBillable',
      json,
      () => WorkflowRunUsageBillable(
        ubuntu: WorkflowRunUsageBillableUbuntu.maybeFromJson(
          json['UBUNTU'] as Map<String, dynamic>?,
        ),
        macos: WorkflowRunUsageBillableMacos.maybeFromJson(
          json['MACOS'] as Map<String, dynamic>?,
        ),
        windows: WorkflowRunUsageBillableWindows.maybeFromJson(
          json['WINDOWS'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowRunUsageBillable? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WorkflowRunUsageBillable.fromJson(json);
  }

  final WorkflowRunUsageBillableUbuntu? ubuntu;
  final WorkflowRunUsageBillableMacos? macos;
  final WorkflowRunUsageBillableWindows? windows;

  /// Converts a [WorkflowRunUsageBillable] to a `Map<String, dynamic>`.
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
    return other is WorkflowRunUsageBillable &&
        ubuntu == other.ubuntu &&
        macos == other.macos &&
        windows == other.windows;
  }
}
