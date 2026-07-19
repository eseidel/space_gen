import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template deployment_branch_policy_settings}
/// The type of deployment branch policy for this environment. To allow all
/// branches to deploy, set to `null`.
/// {@endtemplate}
@immutable
class DeploymentBranchPolicySettings {
  /// {@macro deployment_branch_policy_settings}
  const DeploymentBranchPolicySettings({
    required this.protectedBranches,
    required this.customBranchPolicies,
  });

  /// Converts a `Map<String, dynamic>` to a [DeploymentBranchPolicySettings].
  factory DeploymentBranchPolicySettings.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DeploymentBranchPolicySettings',
      json,
      () => DeploymentBranchPolicySettings(
        protectedBranches: json['protected_branches'] as bool,
        customBranchPolicies: json['custom_branch_policies'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DeploymentBranchPolicySettings? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DeploymentBranchPolicySettings.fromJson(json);
  }

  /// Whether only branches with branch protection rules can deploy to this
  /// environment. If `protected_branches` is `true`, `custom_branch_policies`
  /// must be `false`; if `protected_branches` is `false`,
  /// `custom_branch_policies` must be `true`.
  final bool protectedBranches;

  /// Whether only branches that match the specified name patterns can deploy
  /// to this environment.  If `custom_branch_policies` is `true`,
  /// `protected_branches` must be `false`; if `custom_branch_policies` is
  /// `false`, `protected_branches` must be `true`.
  final bool customBranchPolicies;

  /// Converts a [DeploymentBranchPolicySettings] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'protected_branches': protectedBranches,
      'custom_branch_policies': customBranchPolicies,
    };
  }

  @override
  int get hashCode => Object.hashAll([protectedBranches, customBranchPolicies]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeploymentBranchPolicySettings &&
        protectedBranches == other.protectedBranches &&
        customBranchPolicies == other.customBranchPolicies;
  }
}
