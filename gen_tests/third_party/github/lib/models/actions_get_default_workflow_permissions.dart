import 'package:github/model_helpers.dart';
import 'package:github/models/actions_can_approve_pull_request_reviews.dart';
import 'package:github/models/actions_default_workflow_permissions.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsGetDefaultWorkflowPermissions {
  const ActionsGetDefaultWorkflowPermissions({
    required this.defaultWorkflowPermissions,
    required this.canApprovePullRequestReviews,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsGetDefaultWorkflowPermissions].
  factory ActionsGetDefaultWorkflowPermissions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsGetDefaultWorkflowPermissions',
      json,
      () => ActionsGetDefaultWorkflowPermissions(
        defaultWorkflowPermissions: ActionsDefaultWorkflowPermissions.fromJson(
          json['default_workflow_permissions'] as String,
        ),
        canApprovePullRequestReviews:
            ActionsCanApprovePullRequestReviews.fromJson(
              json['can_approve_pull_request_reviews'] as bool,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsGetDefaultWorkflowPermissions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsGetDefaultWorkflowPermissions.fromJson(json);
  }

  /// The default workflow permissions granted to the GITHUB_TOKEN when
  /// running workflows.
  final ActionsDefaultWorkflowPermissions defaultWorkflowPermissions;

  /// Whether GitHub Actions can approve pull requests. Enabling this can be a
  /// security risk.
  final ActionsCanApprovePullRequestReviews canApprovePullRequestReviews;

  /// Converts an [ActionsGetDefaultWorkflowPermissions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'default_workflow_permissions': defaultWorkflowPermissions.toJson(),
      'can_approve_pull_request_reviews': canApprovePullRequestReviews.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    defaultWorkflowPermissions,
    canApprovePullRequestReviews,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsGetDefaultWorkflowPermissions &&
        defaultWorkflowPermissions == other.defaultWorkflowPermissions &&
        canApprovePullRequestReviews == other.canApprovePullRequestReviews;
  }
}
