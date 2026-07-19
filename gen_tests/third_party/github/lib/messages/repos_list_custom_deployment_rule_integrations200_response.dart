import 'package:github/model_helpers.dart';
import 'package:github/models/custom_deployment_rule_app.dart';
import 'package:meta/meta.dart';

@immutable
class ReposListCustomDeploymentRuleIntegrations200Response {
  const ReposListCustomDeploymentRuleIntegrations200Response({
    this.totalCount,
    this.availableCustomDeploymentProtectionRuleIntegrations,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposListCustomDeploymentRuleIntegrations200Response].
  factory ReposListCustomDeploymentRuleIntegrations200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposListCustomDeploymentRuleIntegrations200Response',
      json,
      () => ReposListCustomDeploymentRuleIntegrations200Response(
        totalCount: json['total_count'] as int?,
        availableCustomDeploymentProtectionRuleIntegrations:
            (json['available_custom_deployment_protection_rule_integrations']
                    as List?)
                ?.map<CustomDeploymentRuleApp>(
                  (e) => CustomDeploymentRuleApp.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposListCustomDeploymentRuleIntegrations200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposListCustomDeploymentRuleIntegrations200Response.fromJson(json);
  }

  /// The total number of custom deployment protection rule integrations
  /// available for this environment.
  /// Example: `35`
  final int? totalCount;
  final List<CustomDeploymentRuleApp>?
  availableCustomDeploymentProtectionRuleIntegrations;

  /// Converts a [ReposListCustomDeploymentRuleIntegrations200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'available_custom_deployment_protection_rule_integrations':
          availableCustomDeploymentProtectionRuleIntegrations
              ?.map((e) => e.toJson())
              .toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    totalCount,
    listHash(availableCustomDeploymentProtectionRuleIntegrations),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposListCustomDeploymentRuleIntegrations200Response &&
        totalCount == other.totalCount &&
        listsEqual(
          availableCustomDeploymentProtectionRuleIntegrations,
          other.availableCustomDeploymentProtectionRuleIntegrations,
        );
  }
}
