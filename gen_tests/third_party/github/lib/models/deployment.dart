import 'package:github/model_helpers.dart';
import 'package:github/models/deployment_payload.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template deployment}
/// Deployment
/// A request for a specific ref(branch,sha,tag) to be deployed
/// {@endtemplate}
@immutable
class Deployment {
  /// {@macro deployment}
  const Deployment({
    required this.url,
    required this.id,
    required this.nodeId,
    required this.sha,
    required this.ref,
    required this.task,
    required this.payload,
    required this.environment,
    required this.description,
    required this.creator,
    required this.createdAt,
    required this.updatedAt,
    required this.statusesUrl,
    required this.repositoryUrl,
    this.originalEnvironment,
    this.transientEnvironment,
    this.productionEnvironment,
    this.performedViaGithubApp,
  });

  /// Converts a `Map<String, dynamic>` to a [Deployment].
  factory Deployment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Deployment',
      json,
      () => Deployment(
        url: Uri.parse(json['url'] as String),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        sha: json['sha'] as String,
        ref: json['ref'] as String,
        task: json['task'] as String,
        payload: DeploymentPayload.fromJson(
          json['payload'] as Map<String, dynamic>,
        ),
        originalEnvironment: json['original_environment'] as String?,
        environment: json['environment'] as String,
        description: checkedKey(json, 'description') as String?,
        creator: SimpleUser.maybeFromJson(
          checkedKey(json, 'creator') as Map<String, dynamic>?,
        ),
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
  static Deployment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Deployment.fromJson(json);
  }

  /// Example: `'https://api.github.com/repos/octocat/example/deployments/1'`
  final Uri url;

  /// Unique identifier of the deployment
  /// Example: `42`
  final int id;

  /// Example: `'MDEwOkRlcGxveW1lbnQx'`
  final String nodeId;

  /// Example: `'a84d88e7554fc1fa21bcbc4efae3c782a70d2b9d'`
  final String sha;

  /// The ref to deploy. This can be a branch, tag, or sha.
  /// Example: `'topic-branch'`
  final String ref;

  /// Parameter to specify a task to execute
  /// Example: `'deploy'`
  final String task;
  final DeploymentPayload payload;

  /// Example: `'staging'`
  final String? originalEnvironment;

  /// Name for the target deployment environment.
  /// Example: `'production'`
  final String environment;

  /// Example: `'Deploy request from hubot'`
  final String? description;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? creator;

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

  /// Converts a [Deployment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'id': id,
      'node_id': nodeId,
      'sha': sha,
      'ref': ref,
      'task': task,
      'payload': payload.toJson(),
      'original_environment': ?originalEnvironment,
      'environment': environment,
      'description': description,
      'creator': creator?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'statuses_url': statusesUrl.toString(),
      'repository_url': repositoryUrl.toString(),
      'transient_environment': ?transientEnvironment,
      'production_environment': ?productionEnvironment,
      'performed_via_github_app': performedViaGithubApp?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    id,
    nodeId,
    sha,
    ref,
    task,
    payload,
    originalEnvironment,
    environment,
    description,
    creator,
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
    return other is Deployment &&
        url == other.url &&
        id == other.id &&
        nodeId == other.nodeId &&
        sha == other.sha &&
        ref == other.ref &&
        task == other.task &&
        payload == other.payload &&
        originalEnvironment == other.originalEnvironment &&
        environment == other.environment &&
        description == other.description &&
        creator == other.creator &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        statusesUrl == other.statusesUrl &&
        repositoryUrl == other.repositoryUrl &&
        transientEnvironment == other.transientEnvironment &&
        productionEnvironment == other.productionEnvironment &&
        performedViaGithubApp == other.performedViaGithubApp;
  }
}
