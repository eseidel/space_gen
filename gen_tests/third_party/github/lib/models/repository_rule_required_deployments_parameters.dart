// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleRequiredDeploymentsParameters {
  const RepositoryRuleRequiredDeploymentsParameters({
    required this.requiredDeploymentEnvironments,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleRequiredDeploymentsParameters].
  factory RepositoryRuleRequiredDeploymentsParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleRequiredDeploymentsParameters',
      json,
      () => RepositoryRuleRequiredDeploymentsParameters(
        requiredDeploymentEnvironments:
            (json['required_deployment_environments'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleRequiredDeploymentsParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleRequiredDeploymentsParameters.fromJson(json);
  }

  /// The environments that must be successfully deployed to before branches
  /// can be merged.
  final List<String> requiredDeploymentEnvironments;

  /// Converts a [RepositoryRuleRequiredDeploymentsParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'required_deployment_environments': requiredDeploymentEnvironments};
  }

  @override
  int get hashCode => listHash(requiredDeploymentEnvironments).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleRequiredDeploymentsParameters &&
        listsEqual(
          requiredDeploymentEnvironments,
          other.requiredDeploymentEnvironments,
        );
  }
}
