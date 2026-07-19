import 'package:github/model_helpers.dart';
import 'package:github/models/actions_enabled.dart';
import 'package:github/models/allowed_actions.dart';
import 'package:github/models/selected_actions_url.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsRepositoryPermissions {
  const ActionsRepositoryPermissions({
    required this.enabled,
    this.allowedActions,
    this.selectedActionsUrl,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsRepositoryPermissions].
  factory ActionsRepositoryPermissions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsRepositoryPermissions',
      json,
      () => ActionsRepositoryPermissions(
        enabled: ActionsEnabled.fromJson(json['enabled'] as bool),
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
  static ActionsRepositoryPermissions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsRepositoryPermissions.fromJson(json);
  }

  /// Whether GitHub Actions is enabled on the repository.
  final ActionsEnabled enabled;

  /// The permissions policy that controls the actions and reusable workflows
  /// that are allowed to run.
  final AllowedActions? allowedActions;

  /// The API URL to use to get or set the actions and reusable workflows that
  /// are allowed to run, when `allowed_actions` is set to `selected`.
  final SelectedActionsUrl? selectedActionsUrl;

  /// Converts an [ActionsRepositoryPermissions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled.toJson(),
      if (allowedActions != null) 'allowed_actions': allowedActions?.toJson(),
      if (selectedActionsUrl != null)
        'selected_actions_url': selectedActionsUrl?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([enabled, allowedActions, selectedActionsUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsRepositoryPermissions &&
        enabled == other.enabled &&
        allowedActions == other.allowedActions &&
        selectedActionsUrl == other.selectedActionsUrl;
  }
}
