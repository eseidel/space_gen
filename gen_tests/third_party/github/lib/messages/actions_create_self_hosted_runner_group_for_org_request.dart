// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/actions_create_self_hosted_runner_group_for_org_request_visibility.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsCreateSelfHostedRunnerGroupForOrgRequest {
  const ActionsCreateSelfHostedRunnerGroupForOrgRequest({
    required this.name,
    this.visibility =
        ActionsCreateSelfHostedRunnerGroupForOrgRequestVisibility.all,
    this.selectedRepositoryIds,
    this.runners,
    this.allowsPublicRepositories = false,
    this.restrictedToWorkflows = false,
    this.selectedWorkflows,
    this.networkConfigurationId,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsCreateSelfHostedRunnerGroupForOrgRequest].
  factory ActionsCreateSelfHostedRunnerGroupForOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsCreateSelfHostedRunnerGroupForOrgRequest',
      json,
      () => ActionsCreateSelfHostedRunnerGroupForOrgRequest(
        name: json['name'] as String,
        visibility:
            ActionsCreateSelfHostedRunnerGroupForOrgRequestVisibility.maybeFromJson(
              json['visibility'] as String?,
            ) ??
            ActionsCreateSelfHostedRunnerGroupForOrgRequestVisibility.all,
        selectedRepositoryIds: (json['selected_repository_ids'] as List?)
            ?.cast<int>(),
        runners: (json['runners'] as List?)?.cast<int>(),
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
  static ActionsCreateSelfHostedRunnerGroupForOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCreateSelfHostedRunnerGroupForOrgRequest.fromJson(json);
  }

  /// Name of the runner group.
  final String name;

  /// Visibility of a runner group. You can select all repositories, select
  /// individual repositories, or limit access to private repositories.
  final ActionsCreateSelfHostedRunnerGroupForOrgRequestVisibility visibility;

  /// List of repository IDs that can access the runner group.
  final List<int>? selectedRepositoryIds;

  /// List of runner IDs to add to the runner group.
  final List<int>? runners;

  /// Whether the runner group can be used by `public` repositories.
  final bool allowsPublicRepositories;

  /// If `true`, the runner group will be restricted to running only the
  /// workflows specified in the `selected_workflows` array.
  final bool restrictedToWorkflows;

  /// List of workflows the runner group should be allowed to run. This
  /// setting will be ignored unless `restricted_to_workflows` is set to
  /// `true`.
  final List<String>? selectedWorkflows;

  /// The identifier of a hosted compute network configuration.
  final String? networkConfigurationId;

  /// Converts an [ActionsCreateSelfHostedRunnerGroupForOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'visibility': visibility.toJson(),
      'selected_repository_ids': ?selectedRepositoryIds,
      'runners': ?runners,
      'allows_public_repositories': allowsPublicRepositories,
      'restricted_to_workflows': restrictedToWorkflows,
      'selected_workflows': ?selectedWorkflows,
      'network_configuration_id': ?networkConfigurationId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    visibility,
    listHash(selectedRepositoryIds),
    listHash(runners),
    allowsPublicRepositories,
    restrictedToWorkflows,
    listHash(selectedWorkflows),
    networkConfigurationId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateSelfHostedRunnerGroupForOrgRequest &&
        name == other.name &&
        visibility == other.visibility &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds) &&
        listsEqual(runners, other.runners) &&
        allowsPublicRepositories == other.allowsPublicRepositories &&
        restrictedToWorkflows == other.restrictedToWorkflows &&
        listsEqual(selectedWorkflows, other.selectedWorkflows) &&
        networkConfigurationId == other.networkConfigurationId;
  }
}
