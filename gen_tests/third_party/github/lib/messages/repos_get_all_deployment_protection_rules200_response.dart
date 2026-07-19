import 'package:github/model_helpers.dart';
import 'package:github/models/deployment_protection_rule.dart';
import 'package:meta/meta.dart';

/// Example:
/// ```json
/// {
///   "$ref": "#/components/examples/deployment-protection-rules"
/// }
/// ```
@immutable
class ReposGetAllDeploymentProtectionRules200Response {
  const ReposGetAllDeploymentProtectionRules200Response({
    this.totalCount,
    this.customDeploymentProtectionRules,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposGetAllDeploymentProtectionRules200Response].
  factory ReposGetAllDeploymentProtectionRules200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposGetAllDeploymentProtectionRules200Response',
      json,
      () => ReposGetAllDeploymentProtectionRules200Response(
        totalCount: json['total_count'] as int?,
        customDeploymentProtectionRules:
            (json['custom_deployment_protection_rules'] as List?)
                ?.map<DeploymentProtectionRule>(
                  (e) => DeploymentProtectionRule.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposGetAllDeploymentProtectionRules200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposGetAllDeploymentProtectionRules200Response.fromJson(json);
  }

  /// The number of enabled custom deployment protection rules for this
  /// environment
  /// Example: `10`
  final int? totalCount;
  final List<DeploymentProtectionRule>? customDeploymentProtectionRules;

  /// Converts a [ReposGetAllDeploymentProtectionRules200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (totalCount != null) 'total_count': totalCount,
      if (customDeploymentProtectionRules != null)
        'custom_deployment_protection_rules': customDeploymentProtectionRules
            ?.map((e) => e.toJson())
            .toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([totalCount, listHash(customDeploymentProtectionRules)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetAllDeploymentProtectionRules200Response &&
        totalCount == other.totalCount &&
        listsEqual(
          customDeploymentProtectionRules,
          other.customDeploymentProtectionRules,
        );
  }
}
