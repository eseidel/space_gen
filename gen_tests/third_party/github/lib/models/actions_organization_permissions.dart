import 'package:github/model_helpers.dart';
import 'package:github/models/allowed_actions.dart';
import 'package:github/models/enabled_repositories.dart';
import 'package:github/models/selected_actions_url.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsOrganizationPermissions {
  const ActionsOrganizationPermissions({
    required this.enabledRepositories,
    this.selectedRepositoriesUrl,
    this.allowedActions,
    this.selectedActionsUrl,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsOrganizationPermissions].
  factory ActionsOrganizationPermissions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsOrganizationPermissions',
      json,
      () => ActionsOrganizationPermissions(
        enabledRepositories: EnabledRepositories.fromJson(
          json['enabled_repositories'] as String,
        ),
        selectedRepositoriesUrl: json['selected_repositories_url'] as String?,
        allowedActions: AllowedActions.maybeFromJson(
          json['allowed_actions'] as String?,
        ),
        selectedActionsUrl: SelectedActionsUrl.maybeFromJson(
          json['selected_actions_url'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsOrganizationPermissions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsOrganizationPermissions.fromJson(json);
  }

  /// The policy that controls the repositories in the organization that are
  /// allowed to run GitHub Actions.
  final EnabledRepositories enabledRepositories;

  /// The API URL to use to get or set the selected repositories that are
  /// allowed to run GitHub Actions, when `enabled_repositories` is set to
  /// `selected`.
  final String? selectedRepositoriesUrl;

  /// The permissions policy that controls the actions and reusable workflows
  /// that are allowed to run.
  final AllowedActions? allowedActions;

  /// The API URL to use to get or set the actions and reusable workflows that
  /// are allowed to run, when `allowed_actions` is set to `selected`.
  final SelectedActionsUrl? selectedActionsUrl;

  /// Converts an [ActionsOrganizationPermissions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'enabled_repositories': enabledRepositories.toJson(),
      if (selectedRepositoriesUrl != null)
        'selected_repositories_url': selectedRepositoriesUrl,
      if (allowedActions != null) 'allowed_actions': allowedActions?.toJson(),
      if (selectedActionsUrl != null)
        'selected_actions_url': selectedActionsUrl?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    enabledRepositories,
    selectedRepositoriesUrl,
    allowedActions,
    selectedActionsUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsOrganizationPermissions &&
        enabledRepositories == other.enabledRepositories &&
        selectedRepositoriesUrl == other.selectedRepositoriesUrl &&
        allowedActions == other.allowedActions &&
        selectedActionsUrl == other.selectedActionsUrl;
  }
}
