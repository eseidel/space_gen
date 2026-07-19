import 'package:github/model_helpers.dart';
import 'package:github/models/deployment_status_state.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template deployment_status}
/// Deployment Status
/// The status of a deployment.
/// {@endtemplate}
@immutable
class DeploymentStatus {
  /// {@macro deployment_status}
  DeploymentStatus({
    required this.url,
    required this.id,
    required this.nodeId,
    required this.state,
    required this.creator,
    required this.createdAt,
    required this.updatedAt,
    required this.deploymentUrl,
    required this.repositoryUrl,
    this.description = '',
    this.environment = '',
    Uri? targetUrl,
    Uri? environmentUrl,
    Uri? logUrl,
    this.performedViaGithubApp,
  }) : targetUrl = targetUrl ?? Uri.parse(''),
       environmentUrl = environmentUrl ?? Uri.parse(''),
       logUrl = logUrl ?? Uri.parse('');

  /// Converts a `Map<String, dynamic>` to a [DeploymentStatus].
  factory DeploymentStatus.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DeploymentStatus',
      json,
      () => DeploymentStatus(
        url: Uri.parse(json['url'] as String),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        state: DeploymentStatusState.fromJson(json['state'] as String),
        creator: SimpleUser.maybeFromJson(
          checkedKey(json, 'creator') as Map<String, dynamic>?,
        ),
        description: json['description'] as String,
        environment: (json['environment'] as String?) ?? '',
        targetUrl: Uri.parse(json['target_url'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        deploymentUrl: Uri.parse(json['deployment_url'] as String),
        repositoryUrl: Uri.parse(json['repository_url'] as String),
        environmentUrl:
            maybeParseUri(json['environment_url'] as String?) ?? Uri.parse(''),
        logUrl: maybeParseUri(json['log_url'] as String?) ?? Uri.parse(''),
        performedViaGithubApp: Integration.maybeFromJson(
          json['performed_via_github_app'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DeploymentStatus? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DeploymentStatus.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/octocat/example/deployments/42/statuses/1'`
  final Uri url;

  /// Example: `1`
  final int id;

  /// Example: `'MDE2OkRlcGxveW1lbnRTdGF0dXMx'`
  final String nodeId;

  /// The state of the status.
  /// Example: `'success'`
  final DeploymentStatusState state;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? creator;

  /// A short description of the status.
  /// Example: `'Deployment finished successfully.'`
  final String description;

  /// The environment of the deployment that the status is for.
  /// Example: `'production'`
  final String environment;

  /// Closing down notice: the URL to associate with this status.
  /// Example: `'https://example.com/deployment/42/output'`
  final Uri targetUrl;

  /// Example: `'2012-07-20T01:19:13Z'`
  final DateTime createdAt;

  /// Example: `'2012-07-20T01:19:13Z'`
  final DateTime updatedAt;

  /// Example: `'https://api.github.com/repos/octocat/example/deployments/42'`
  final Uri deploymentUrl;

  /// Example: `'https://api.github.com/repos/octocat/example'`
  final Uri repositoryUrl;

  /// The URL for accessing your environment.
  /// Example: `'https://staging.example.com/'`
  final Uri environmentUrl;

  /// The URL to associate with this status.
  /// Example: `'https://example.com/deployment/42/output'`
  final Uri logUrl;

  /// GitHub app
  /// GitHub apps are a new way to extend GitHub. They can be installed
  /// directly on organizations and user accounts and granted access to
  /// specific repositories. They come with granular permissions and built-in
  /// webhooks. GitHub apps are first class actors within GitHub.
  final Integration? performedViaGithubApp;

  /// Converts a [DeploymentStatus] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'id': id,
      'node_id': nodeId,
      'state': state.toJson(),
      'creator': creator?.toJson(),
      'description': description,
      'environment': environment,
      'target_url': targetUrl.toString(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deployment_url': deploymentUrl.toString(),
      'repository_url': repositoryUrl.toString(),
      'environment_url': environmentUrl.toString(),
      'log_url': logUrl.toString(),
      'performed_via_github_app': performedViaGithubApp?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    id,
    nodeId,
    state,
    creator,
    description,
    environment,
    targetUrl,
    createdAt,
    updatedAt,
    deploymentUrl,
    repositoryUrl,
    environmentUrl,
    logUrl,
    performedViaGithubApp,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeploymentStatus &&
        url == other.url &&
        id == other.id &&
        nodeId == other.nodeId &&
        state == other.state &&
        creator == other.creator &&
        description == other.description &&
        environment == other.environment &&
        targetUrl == other.targetUrl &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        deploymentUrl == other.deploymentUrl &&
        repositoryUrl == other.repositoryUrl &&
        environmentUrl == other.environmentUrl &&
        logUrl == other.logUrl &&
        performedViaGithubApp == other.performedViaGithubApp;
  }
}
