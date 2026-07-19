import 'package:github/model_helpers.dart';
import 'package:github/models/integration.dart';
import 'package:meta/meta.dart';

/// {@template deployment_simple}
/// Deployment
/// A deployment created as the result of an Actions check run from a workflow
/// that references an environment
/// {@endtemplate}
@immutable
class DeploymentSimple {
  /// {@macro deployment_simple}
  const DeploymentSimple({
    required this.url,
    required this.id,
    required this.nodeId,
    required this.task,
    required this.environment,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.statusesUrl,
    required this.repositoryUrl,
    this.originalEnvironment,
    this.transientEnvironment,
    this.productionEnvironment,
    this.performedViaGithubApp,
  });

  /// Converts a `Map<String, dynamic>` to a [DeploymentSimple].
  factory DeploymentSimple.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DeploymentSimple',
      json,
      () => DeploymentSimple(
        url: Uri.parse(json['url'] as String),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        task: json['task'] as String,
        originalEnvironment: json['original_environment'] as String?,
        environment: json['environment'] as String,
        description: checkedKey(json, 'description') as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        statusesUrl: Uri.parse(json['statuses_url'] as String),
        repositoryUrl: Uri.parse(json['repository_url'] as String),
        transientEnvironment: json['transient_environment'] as bool?,
        productionEnvironment: json['production_environment'] as bool?,
        performedViaGithubApp: Integration.maybeFromJson(
          json['performed_via_github_app'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DeploymentSimple? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DeploymentSimple.fromJson(json);
  }

  /// Example: `'https://api.github.com/repos/octocat/example/deployments/1'`
  final Uri url;

  /// Unique identifier of the deployment
  /// Example: `42`
  final int id;

  /// Example: `'MDEwOkRlcGxveW1lbnQx'`
  final String nodeId;

  /// Parameter to specify a task to execute
  /// Example: `'deploy'`
  final String task;

  /// Example: `'staging'`
  final String? originalEnvironment;

  /// Name for the target deployment environment.
  /// Example: `'production'`
  final String environment;

  /// Example: `'Deploy request from hubot'`
  final String? description;

  /// Example: `'2012-07-20T01:19:13Z'`
  final DateTime createdAt;

  /// Example: `'2012-07-20T01:19:13Z'`
  final DateTime updatedAt;

  /// Example:
  /// `'https://api.github.com/repos/octocat/example/deployments/1/statuses'`
  final Uri statusesUrl;

  /// Example: `'https://api.github.com/repos/octocat/example'`
  final Uri repositoryUrl;

  /// Specifies if the given environment is will no longer exist at some point
  /// in the future. Default: false.
  /// Example: `true`
  final bool? transientEnvironment;

  /// Specifies if the given environment is one that end-users directly
  /// interact with. Default: false.
  /// Example: `true`
  final bool? productionEnvironment;

  /// GitHub app
  /// GitHub apps are a new way to extend GitHub. They can be installed
  /// directly on organizations and user accounts and granted access to
  /// specific repositories. They come with granular permissions and built-in
  /// webhooks. GitHub apps are first class actors within GitHub.
  final Integration? performedViaGithubApp;

  /// Converts a [DeploymentSimple] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'id': id,
      'node_id': nodeId,
      'task': task,
      'original_environment': originalEnvironment,
      'environment': environment,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'statuses_url': statusesUrl.toString(),
      'repository_url': repositoryUrl.toString(),
      'transient_environment': transientEnvironment,
      'production_environment': productionEnvironment,
      'performed_via_github_app': performedViaGithubApp?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    id,
    nodeId,
    task,
    originalEnvironment,
    environment,
    description,
    createdAt,
    updatedAt,
    statusesUrl,
    repositoryUrl,
    transientEnvironment,
    productionEnvironment,
    performedViaGithubApp,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeploymentSimple &&
        url == other.url &&
        id == other.id &&
        nodeId == other.nodeId &&
        task == other.task &&
        originalEnvironment == other.originalEnvironment &&
        environment == other.environment &&
        description == other.description &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        statusesUrl == other.statusesUrl &&
        repositoryUrl == other.repositoryUrl &&
        transientEnvironment == other.transientEnvironment &&
        productionEnvironment == other.productionEnvironment &&
        performedViaGithubApp == other.performedViaGithubApp;
  }
}
