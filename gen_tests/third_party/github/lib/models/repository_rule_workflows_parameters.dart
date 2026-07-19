import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_params_workflow_file_reference.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleWorkflowsParameters {
  const RepositoryRuleWorkflowsParameters({
    required this.workflows,
    this.doNotEnforceOnCreate,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleWorkflowsParameters].
  factory RepositoryRuleWorkflowsParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleWorkflowsParameters',
      json,
      () => RepositoryRuleWorkflowsParameters(
        doNotEnforceOnCreate: json['do_not_enforce_on_create'] as bool?,
        workflows: (json['workflows'] as List)
            .map<RepositoryRuleParamsWorkflowFileReference>(
              (e) => RepositoryRuleParamsWorkflowFileReference.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleWorkflowsParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleWorkflowsParameters.fromJson(json);
  }

  /// Allow repositories and branches to be created if a check would otherwise
  /// prohibit it.
  final bool? doNotEnforceOnCreate;

  /// Workflows that must pass for this rule to pass.
  final List<RepositoryRuleParamsWorkflowFileReference> workflows;

  /// Converts a [RepositoryRuleWorkflowsParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'do_not_enforce_on_create': doNotEnforceOnCreate,
      'workflows': workflows.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([doNotEnforceOnCreate, listHash(workflows)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleWorkflowsParameters &&
        doNotEnforceOnCreate == other.doNotEnforceOnCreate &&
        listsEqual(workflows, other.workflows);
  }
}
