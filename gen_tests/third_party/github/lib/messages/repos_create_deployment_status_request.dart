import 'package:github/model_helpers.dart';
import 'package:github/models/repos_create_deployment_status_request_state.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateDeploymentStatusRequest {
  const ReposCreateDeploymentStatusRequest({
    required this.state,
    this.targetUrl = '',
    this.logUrl = '',
    this.description = '',
    this.environment,
    this.environmentUrl = '',
    this.autoInactive,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreateDeploymentStatusRequest].
  factory ReposCreateDeploymentStatusRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreateDeploymentStatusRequest',
      json,
      () => ReposCreateDeploymentStatusRequest(
        state: ReposCreateDeploymentStatusRequestState.fromJson(
          json['state'] as String,
        ),
        targetUrl: (json['target_url'] as String?) ?? '',
        logUrl: (json['log_url'] as String?) ?? '',
        description: (json['description'] as String?) ?? '',
        environment: json['environment'] as String?,
        environmentUrl: (json['environment_url'] as String?) ?? '',
        autoInactive: json['auto_inactive'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateDeploymentStatusRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateDeploymentStatusRequest.fromJson(json);
  }

  /// The state of the status. When you set a transient deployment to
  /// `inactive`, the deployment will be shown as `destroyed` in GitHub.
  final ReposCreateDeploymentStatusRequestState state;

  /// The target URL to associate with this status. This URL should contain
  /// output to keep the user updated while the task is running or serve as
  /// historical information for what happened in the deployment.
  ///
  /// > [!NOTE]
  /// > It's recommended to use the `log_url` parameter, which replaces
  /// `target_url`.
  final String? targetUrl;

  /// The full URL of the deployment's output. This parameter replaces
  /// `target_url`. We will continue to accept `target_url` to support legacy
  /// uses, but we recommend replacing `target_url` with `log_url`. Setting
  /// `log_url` will automatically set `target_url` to the same value.
  /// Default: `""`
  final String? logUrl;

  /// A short description of the status. The maximum description length is 140
  /// characters.
  final String? description;

  /// Name for the target deployment environment, which can be changed when
  /// setting a deploy status. For example, `production`, `staging`, or `qa`.
  /// If not defined, the environment of the previous status on the deployment
  /// will be used, if it exists. Otherwise, the environment of the deployment
  /// will be used.
  final String? environment;

  /// Sets the URL for accessing your environment. Default: `""`
  final String? environmentUrl;

  /// Adds a new `inactive` status to all prior non-transient, non-production
  /// environment deployments with the same repository and `environment` name
  /// as the created status's deployment. An `inactive` status is only added
  /// to deployments that had a `success` state. Default: `true`
  final bool? autoInactive;

  /// Converts a [ReposCreateDeploymentStatusRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'state': state.toJson(),
      'target_url': targetUrl,
      'log_url': logUrl,
      'description': description,
      'environment': environment,
      'environment_url': environmentUrl,
      'auto_inactive': autoInactive,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    state,
    targetUrl,
    logUrl,
    description,
    environment,
    environmentUrl,
    autoInactive,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateDeploymentStatusRequest &&
        state == other.state &&
        targetUrl == other.targetUrl &&
        logUrl == other.logUrl &&
        description == other.description &&
        environment == other.environment &&
        environmentUrl == other.environmentUrl &&
        autoInactive == other.autoInactive;
  }
}
