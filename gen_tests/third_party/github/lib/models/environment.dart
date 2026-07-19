// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/deployment_branch_policy_settings.dart';
import 'package:github/models/environment_protection_rules_inner.dart';
import 'package:meta/meta.dart';

/// {@template environment}
/// Environment
/// Details of a deployment environment
/// {@endtemplate}
@immutable
class Environment {
  /// {@macro environment}
  const Environment({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.url,
    required this.htmlUrl,
    required this.createdAt,
    required this.updatedAt,
    this.protectionRules,
    this.deploymentBranchPolicy,
  });

  /// Converts a `Map<String, dynamic>` to an [Environment].
  factory Environment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Environment',
      json,
      () => Environment(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        name: json['name'] as String,
        url: json['url'] as String,
        htmlUrl: json['html_url'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        protectionRules: (json['protection_rules'] as List?)
            ?.map<EnvironmentProtectionRulesInner>(
              (e) => EnvironmentProtectionRulesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        deploymentBranchPolicy: DeploymentBranchPolicySettings.maybeFromJson(
          json['deployment_branch_policy'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Environment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Environment.fromJson(json);
  }

  /// The id of the environment.
  /// Example: `56780428`
  final int id;

  /// Example: `'MDExOkVudmlyb25tZW50NTY3ODA0Mjg='`
  final String nodeId;

  /// The name of the environment.
  /// Example: `'staging'`
  final String name;

  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/environments/staging'`
  final String url;

  /// Example:
  /// `'https://github.com/github/hello-world/deployments/activity_log?environments_filter=staging'`
  final String htmlUrl;

  /// The time that the environment was created, in ISO 8601 format.
  /// Example: `'2020-11-23T22:00:40Z'`
  final DateTime createdAt;

  /// The time that the environment was last updated, in ISO 8601 format.
  /// Example: `'2020-11-23T22:00:40Z'`
  final DateTime updatedAt;

  /// Built-in deployment protection rules for the environment.
  final List<EnvironmentProtectionRulesInner>? protectionRules;

  /// The type of deployment branch policy for this environment. To allow all
  /// branches to deploy, set to `null`.
  final DeploymentBranchPolicySettings? deploymentBranchPolicy;

  /// Converts an [Environment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'name': name,
      'url': url,
      'html_url': htmlUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'protection_rules': ?protectionRules?.map((e) => e.toJson()).toList(),
      'deployment_branch_policy': deploymentBranchPolicy?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    name,
    url,
    htmlUrl,
    createdAt,
    updatedAt,
    listHash(protectionRules),
    deploymentBranchPolicy,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Environment &&
        id == other.id &&
        nodeId == other.nodeId &&
        name == other.name &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        listsEqual(protectionRules, other.protectionRules) &&
        deploymentBranchPolicy == other.deploymentBranchPolicy;
  }
}
