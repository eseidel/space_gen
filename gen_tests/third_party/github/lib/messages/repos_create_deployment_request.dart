import 'package:github/model_helpers.dart';
import 'package:github/models/repos_create_deployment_request_payload.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateDeploymentRequest {
  const ReposCreateDeploymentRequest({
    required this.ref,
    this.task = 'deploy',
    this.autoMerge = true,
    this.requiredContexts,
    this.payload,
    this.environment = 'production',
    this.description = '',
    this.transientEnvironment = false,
    this.productionEnvironment,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposCreateDeploymentRequest].
  factory ReposCreateDeploymentRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateDeploymentRequest',
      json,
      () => ReposCreateDeploymentRequest(
        ref: json['ref'] as String,
        task: (json['task'] as String?) ?? 'deploy',
        autoMerge: (json['auto_merge'] as bool?) ?? true,
        requiredContexts: (json['required_contexts'] as List?)?.cast<String>(),
        payload: ReposCreateDeploymentRequestPayload.maybeFromJson(
          json['payload'] as Map<String, dynamic>?,
        ),
        environment: (json['environment'] as String?) ?? 'production',
        description: json.containsKey('description')
            ? json['description'] as String?
            : '',
        transientEnvironment: (json['transient_environment'] as bool?) ?? false,
        productionEnvironment: json['production_environment'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateDeploymentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateDeploymentRequest.fromJson(json);
  }

  /// The ref to deploy. This can be a branch, tag, or SHA.
  final String ref;

  /// Specifies a task to execute (e.g., `deploy` or `deploy:migrations`).
  final String task;

  /// Attempts to automatically merge the default branch into the requested
  /// ref, if it's behind the default branch.
  final bool autoMerge;

  /// The [status](https://docs.github.com/rest/commits/statuses) contexts to
  /// verify against commit status checks. If you omit this parameter, GitHub
  /// verifies all unique contexts before creating a deployment. To bypass
  /// checking entirely, pass an empty array. Defaults to all unique contexts.
  final List<String>? requiredContexts;
  final ReposCreateDeploymentRequestPayload? payload;

  /// Name for the target deployment environment (e.g., `production`,
  /// `staging`, `qa`).
  final String environment;

  /// Short description of the deployment.
  final String? description;

  /// Specifies if the given environment is specific to the deployment and
  /// will no longer exist at some point in the future. Default: `false`
  final bool transientEnvironment;

  /// Specifies if the given environment is one that end-users directly
  /// interact with. Default: `true` when `environment` is `production` and
  /// `false` otherwise.
  final bool? productionEnvironment;

  /// Converts a [ReposCreateDeploymentRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'ref': ref,
      'task': task,
      'auto_merge': autoMerge,
      'required_contexts': ?requiredContexts,
      'payload': ?payload?.toJson(),
      'environment': environment,
      'description': description,
      'transient_environment': transientEnvironment,
      'production_environment': ?productionEnvironment,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    ref,
    task,
    autoMerge,
    listHash(requiredContexts),
    payload,
    environment,
    description,
    transientEnvironment,
    productionEnvironment,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateDeploymentRequest &&
        ref == other.ref &&
        task == other.task &&
        autoMerge == other.autoMerge &&
        listsEqual(requiredContexts, other.requiredContexts) &&
        payload == other.payload &&
        environment == other.environment &&
        description == other.description &&
        transientEnvironment == other.transientEnvironment &&
        productionEnvironment == other.productionEnvironment;
  }
}
