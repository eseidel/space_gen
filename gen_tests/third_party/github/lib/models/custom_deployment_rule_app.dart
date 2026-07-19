import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template custom_deployment_rule_app}
/// Custom deployment protection rule app
/// A GitHub App that is providing a custom deployment protection rule.
/// {@endtemplate}
@immutable
class CustomDeploymentRuleApp {
  /// {@macro custom_deployment_rule_app}
  const CustomDeploymentRuleApp({
    required this.id,
    required this.slug,
    required this.integrationUrl,
    required this.nodeId,
  });

  /// Converts a `Map<String, dynamic>` to a [CustomDeploymentRuleApp].
  factory CustomDeploymentRuleApp.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CustomDeploymentRuleApp',
      json,
      () => CustomDeploymentRuleApp(
        id: json['id'] as int,
        slug: json['slug'] as String,
        integrationUrl: json['integration_url'] as String,
        nodeId: json['node_id'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CustomDeploymentRuleApp? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CustomDeploymentRuleApp.fromJson(json);
  }

  /// The unique identifier of the deployment protection rule integration.
  /// Example: `3515`
  final int id;

  /// The slugified name of the deployment protection rule integration.
  /// Example: `'my-custom-app'`
  final String slug;

  /// The URL for the endpoint to get details about the app.
  /// Example: `'https://api.github.com/apps/custom-app-slug'`
  final String integrationUrl;

  /// The node ID for the deployment protection rule integration.
  /// Example: `'MDQ6R2F0ZTM1MTU='`
  final String nodeId;

  /// Converts a [CustomDeploymentRuleApp] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'integration_url': integrationUrl,
      'node_id': nodeId,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, slug, integrationUrl, nodeId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomDeploymentRuleApp &&
        id == other.id &&
        slug == other.slug &&
        integrationUrl == other.integrationUrl &&
        nodeId == other.nodeId;
  }
}
