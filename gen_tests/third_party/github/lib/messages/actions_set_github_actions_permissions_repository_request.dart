import 'package:github/model_helpers.dart';
import 'package:github/models/actions_enabled.dart';
import 'package:github/models/allowed_actions.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsSetGithubActionsPermissionsRepositoryRequest {
  const ActionsSetGithubActionsPermissionsRepositoryRequest({
    required this.enabled,
    this.allowedActions,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsSetGithubActionsPermissionsRepositoryRequest].
  factory ActionsSetGithubActionsPermissionsRepositoryRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsSetGithubActionsPermissionsRepositoryRequest',
      json,
      () => ActionsSetGithubActionsPermissionsRepositoryRequest(
        enabled: ActionsEnabled.fromJson(json['enabled'] as bool),
        allowedActions: AllowedActions.maybeFromJson(
          json['allowed_actions'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsSetGithubActionsPermissionsRepositoryRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsSetGithubActionsPermissionsRepositoryRequest.fromJson(json);
  }

  /// Whether GitHub Actions is enabled on the repository.
  final ActionsEnabled enabled;

  /// The permissions policy that controls the actions and reusable workflows
  /// that are allowed to run.
  final AllowedActions? allowedActions;

  /// Converts an [ActionsSetGithubActionsPermissionsRepositoryRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled.toJson(),
      'allowed_actions': ?allowedActions?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([enabled, allowedActions]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsSetGithubActionsPermissionsRepositoryRequest &&
        enabled == other.enabled &&
        allowedActions == other.allowedActions;
  }
}
