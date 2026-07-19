import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RunnerGroupsOrg {
  const RunnerGroupsOrg({
    required this.id,
    required this.name,
    required this.visibility,
    required this.default_,
    required this.runnersUrl,
    required this.inherited,
    required this.allowsPublicRepositories,
    this.selectedRepositoriesUrl,
    this.hostedRunnersUrl,
    this.networkConfigurationId,
    this.inheritedAllowsPublicRepositories,
    this.workflowRestrictionsReadOnly = false,
    this.restrictedToWorkflows = false,
    this.selectedWorkflows,
  });

  /// Converts a `Map<String, dynamic>` to a [RunnerGroupsOrg].
  factory RunnerGroupsOrg.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RunnerGroupsOrg',
      json,
      () => RunnerGroupsOrg(
        id: (json['id'] as num).toDouble(),
        name: json['name'] as String,
        visibility: json['visibility'] as String,
        default_: json['default'] as bool,
        selectedRepositoriesUrl: json['selected_repositories_url'] as String?,
        runnersUrl: json['runners_url'] as String,
        hostedRunnersUrl: json['hosted_runners_url'] as String?,
        networkConfigurationId: json['network_configuration_id'] as String?,
        inherited: json['inherited'] as bool,
        inheritedAllowsPublicRepositories:
            json['inherited_allows_public_repositories'] as bool?,
        allowsPublicRepositories: json['allows_public_repositories'] as bool,
        workflowRestrictionsReadOnly:
            (json['workflow_restrictions_read_only'] as bool?) ?? false,
        restrictedToWorkflows:
            (json['restricted_to_workflows'] as bool?) ?? false,
        selectedWorkflows: (json['selected_workflows'] as List?)
            ?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RunnerGroupsOrg? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RunnerGroupsOrg.fromJson(json);
  }

  final double id;
  final String name;
  final String visibility;
  final bool default_;

  /// Link to the selected repositories resource for this runner group. Not
  /// present unless visibility was set to `selected`
  final String? selectedRepositoriesUrl;
  final String runnersUrl;
  final String? hostedRunnersUrl;

  /// The identifier of a hosted compute network configuration.
  final String? networkConfigurationId;
  final bool inherited;
  final bool? inheritedAllowsPublicRepositories;
  final bool allowsPublicRepositories;

  /// If `true`, the `restricted_to_workflows` and `selected_workflows` fields
  /// cannot be modified.
  final bool workflowRestrictionsReadOnly;

  /// If `true`, the runner group will be restricted to running only the
  /// workflows specified in the `selected_workflows` array.
  final bool restrictedToWorkflows;

  /// List of workflows the runner group should be allowed to run. This
  /// setting will be ignored unless `restricted_to_workflows` is set to
  /// `true`.
  final List<String>? selectedWorkflows;

  /// Converts a [RunnerGroupsOrg] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'visibility': visibility,
      'default': default_,
      if (selectedRepositoriesUrl != null)
        'selected_repositories_url': selectedRepositoriesUrl,
      'runners_url': runnersUrl,
      if (hostedRunnersUrl != null) 'hosted_runners_url': hostedRunnersUrl,
      if (networkConfigurationId != null)
        'network_configuration_id': networkConfigurationId,
      'inherited': inherited,
      if (inheritedAllowsPublicRepositories != null)
        'inherited_allows_public_repositories':
            inheritedAllowsPublicRepositories,
      'allows_public_repositories': allowsPublicRepositories,
      'workflow_restrictions_read_only': workflowRestrictionsReadOnly,
      'restricted_to_workflows': restrictedToWorkflows,
      if (selectedWorkflows != null) 'selected_workflows': selectedWorkflows,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    visibility,
    default_,
    selectedRepositoriesUrl,
    runnersUrl,
    hostedRunnersUrl,
    networkConfigurationId,
    inherited,
    inheritedAllowsPublicRepositories,
    allowsPublicRepositories,
    workflowRestrictionsReadOnly,
    restrictedToWorkflows,
    listHash(selectedWorkflows),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RunnerGroupsOrg &&
        id == other.id &&
        name == other.name &&
        visibility == other.visibility &&
        default_ == other.default_ &&
        selectedRepositoriesUrl == other.selectedRepositoriesUrl &&
        runnersUrl == other.runnersUrl &&
        hostedRunnersUrl == other.hostedRunnersUrl &&
        networkConfigurationId == other.networkConfigurationId &&
        inherited == other.inherited &&
        inheritedAllowsPublicRepositories ==
            other.inheritedAllowsPublicRepositories &&
        allowsPublicRepositories == other.allowsPublicRepositories &&
        workflowRestrictionsReadOnly == other.workflowRestrictionsReadOnly &&
        restrictedToWorkflows == other.restrictedToWorkflows &&
        listsEqual(selectedWorkflows, other.selectedWorkflows);
  }
}
