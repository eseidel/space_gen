// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/actions_update_self_hosted_runner_group_for_org_request_visibility.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsUpdateSelfHostedRunnerGroupForOrgRequest {
  const ActionsUpdateSelfHostedRunnerGroupForOrgRequest({
    required this.name,
    this.visibility,
    this.allowsPublicRepositories = false,
    this.restrictedToWorkflows = false,
    this.selectedWorkflows,
    this.networkConfigurationId,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsUpdateSelfHostedRunnerGroupForOrgRequest].
  factory ActionsUpdateSelfHostedRunnerGroupForOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsUpdateSelfHostedRunnerGroupForOrgRequest',
      json,
      () => ActionsUpdateSelfHostedRunnerGroupForOrgRequest(
        name: json['name'] as String,
        visibility:
            ActionsUpdateSelfHostedRunnerGroupForOrgRequestVisibility.maybeFromJson(
              json['visibility'] as String?,
            ),
        allowsPublicRepositories:
            (json['allows_public_repositories'] as bool?) ?? false,
        restrictedToWorkflows:
            (json['restricted_to_workflows'] as bool?) ?? false,
        selectedWorkflows: (json['selected_workflows'] as List?)
            ?.cast<String>(),
        networkConfigurationId: json['network_configuration_id'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsUpdateSelfHostedRunnerGroupForOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsUpdateSelfHostedRunnerGroupForOrgRequest.fromJson(json);
  }

  /// Name of the runner group.
  final String name;

  /// Visibility of a runner group. You can select all repositories, select
  /// individual repositories, or all private repositories.
  final ActionsUpdateSelfHostedRunnerGroupForOrgRequestVisibility? visibility;

  /// Whether the runner group can be used by `public` repositories.
  final bool? allowsPublicRepositories;

  /// If `true`, the runner group will be restricted to running only the
  /// workflows specified in the `selected_workflows` array.
  final bool? restrictedToWorkflows;

  /// List of workflows the runner group should be allowed to run. This
  /// setting will be ignored unless `restricted_to_workflows` is set to
  /// `true`.
  final List<String>? selectedWorkflows;

  /// The identifier of a hosted compute network configuration.
  final String? networkConfigurationId;

  /// Converts an [ActionsUpdateSelfHostedRunnerGroupForOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'visibility': visibility?.toJson(),
      'allows_public_repositories': allowsPublicRepositories,
      'restricted_to_workflows': restrictedToWorkflows,
      'selected_workflows': selectedWorkflows,
      'network_configuration_id': networkConfigurationId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    visibility,
    allowsPublicRepositories,
    restrictedToWorkflows,
    listHash(selectedWorkflows),
    networkConfigurationId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsUpdateSelfHostedRunnerGroupForOrgRequest &&
        name == other.name &&
        visibility == other.visibility &&
        allowsPublicRepositories == other.allowsPublicRepositories &&
        restrictedToWorkflows == other.restrictedToWorkflows &&
        listsEqual(selectedWorkflows, other.selectedWorkflows) &&
        networkConfigurationId == other.networkConfigurationId;
  }
}
