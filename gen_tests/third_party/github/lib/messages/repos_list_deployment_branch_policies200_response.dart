import 'package:github/model_helpers.dart';
import 'package:github/models/deployment_branch_policy.dart';
import 'package:meta/meta.dart';

@immutable
class ReposListDeploymentBranchPolicies200Response {
  const ReposListDeploymentBranchPolicies200Response({
    required this.totalCount,
    required this.branchPolicies,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposListDeploymentBranchPolicies200Response].
  factory ReposListDeploymentBranchPolicies200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposListDeploymentBranchPolicies200Response',
      json,
      () => ReposListDeploymentBranchPolicies200Response(
        totalCount: json['total_count'] as int,
        branchPolicies: (json['branch_policies'] as List)
            .map<DeploymentBranchPolicy>(
              (e) => DeploymentBranchPolicy.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposListDeploymentBranchPolicies200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposListDeploymentBranchPolicies200Response.fromJson(json);
  }

  /// The number of deployment branch policies for the environment.
  /// Example: `2`
  final int totalCount;
  final List<DeploymentBranchPolicy> branchPolicies;

  /// Converts a [ReposListDeploymentBranchPolicies200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'branch_policies': branchPolicies.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(branchPolicies)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposListDeploymentBranchPolicies200Response &&
        totalCount == other.totalCount &&
        listsEqual(branchPolicies, other.branchPolicies);
  }
}
