import 'package:github/model_helpers.dart';
import 'package:github/models/allowed_actions.dart';
import 'package:github/models/enabled_repositories.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsSetGithubActionsPermissionsOrganizationRequest {
  const ActionsSetGithubActionsPermissionsOrganizationRequest({
    required this.enabledRepositories,
    this.allowedActions,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsSetGithubActionsPermissionsOrganizationRequest].
  factory ActionsSetGithubActionsPermissionsOrganizationRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsSetGithubActionsPermissionsOrganizationRequest',
      json,
      () => ActionsSetGithubActionsPermissionsOrganizationRequest(
        enabledRepositories: EnabledRepositories.fromJson(
          json['enabled_repositories'] as String,
        ),
        allowedActions: AllowedActions.maybeFromJson(
          json['allowed_actions'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsSetGithubActionsPermissionsOrganizationRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsSetGithubActionsPermissionsOrganizationRequest.fromJson(json);
  }

  /// The policy that controls the repositories in the organization that are
  /// allowed to run GitHub Actions.
  final EnabledRepositories enabledRepositories;

  /// The permissions policy that controls the actions and reusable workflows
  /// that are allowed to run.
  final AllowedActions? allowedActions;

  /// Converts an [ActionsSetGithubActionsPermissionsOrganizationRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'enabled_repositories': enabledRepositories.toJson(),
      if (allowedActions != null) 'allowed_actions': allowedActions?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([enabledRepositories, allowedActions]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsSetGithubActionsPermissionsOrganizationRequest &&
        enabledRepositories == other.enabledRepositories &&
        allowedActions == other.allowedActions;
  }
}
