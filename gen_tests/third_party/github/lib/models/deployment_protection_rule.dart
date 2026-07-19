import 'package:github/model_helpers.dart';
import 'package:github/models/custom_deployment_rule_app.dart';
import 'package:meta/meta.dart';

/// {@template deployment_protection_rule}
/// Deployment protection rule
/// Deployment protection rule
/// {@endtemplate}
@immutable
class DeploymentProtectionRule {
  /// {@macro deployment_protection_rule}
  const DeploymentProtectionRule({
    required this.id,
    required this.nodeId,
    required this.enabled,
    required this.app,
  });

  /// Converts a `Map<String, dynamic>` to a [DeploymentProtectionRule].
  factory DeploymentProtectionRule.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DeploymentProtectionRule',
      json,
      () => DeploymentProtectionRule(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        enabled: json['enabled'] as bool,
        app: CustomDeploymentRuleApp.fromJson(
          json['app'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DeploymentProtectionRule? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DeploymentProtectionRule.fromJson(json);
  }

  /// The unique identifier for the deployment protection rule.
  /// Example: `3515`
  final int id;

  /// The node ID for the deployment protection rule.
  /// Example: `'MDQ6R2F0ZTM1MTU='`
  final String nodeId;

  /// Whether the deployment protection rule is enabled for the environment.
  /// Example: `true`
  final bool enabled;

  /// Custom deployment protection rule app
  /// A GitHub App that is providing a custom deployment protection rule.
  final CustomDeploymentRuleApp app;

  /// Converts a [DeploymentProtectionRule] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'enabled': enabled,
      'app': app.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, nodeId, enabled, app]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeploymentProtectionRule &&
        id == other.id &&
        nodeId == other.nodeId &&
        enabled == other.enabled &&
        app == other.app;
  }
}
