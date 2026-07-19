// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/deployment_branch_policy_name_pattern_with_type_type.dart';
import 'package:meta/meta.dart';

/// {@template deployment_branch_policy_name_pattern_with_type}
/// Deployment branch and tag policy name pattern
/// {@endtemplate}
@immutable
class DeploymentBranchPolicyNamePatternWithType {
  /// {@macro deployment_branch_policy_name_pattern_with_type}
  const DeploymentBranchPolicyNamePatternWithType({
    required this.name,
    this.type,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DeploymentBranchPolicyNamePatternWithType].
  factory DeploymentBranchPolicyNamePatternWithType.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DeploymentBranchPolicyNamePatternWithType',
      json,
      () => DeploymentBranchPolicyNamePatternWithType(
        name: json['name'] as String,
        type: DeploymentBranchPolicyNamePatternWithTypeType.maybeFromJson(
          json['type'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DeploymentBranchPolicyNamePatternWithType? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DeploymentBranchPolicyNamePatternWithType.fromJson(json);
  }

  /// The name pattern that branches or tags must match in order to deploy to
  /// the environment.
  ///
  /// Wildcard characters will not match `/`. For example, to match branches
  /// that begin with `release/` and contain an additional single slash, use
  /// `release/*/*`.
  /// For more information about pattern matching syntax, see the [Ruby
  /// File.fnmatch
  /// documentation](https://ruby-doc.org/core-2.5.1/File.html#method-c-fnmatch).
  /// Example: `'release/*'`
  final String name;

  /// Whether this rule targets a branch or tag
  /// Example: `'branch'`
  final DeploymentBranchPolicyNamePatternWithTypeType? type;

  /// Converts a [DeploymentBranchPolicyNamePatternWithType]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'type': type?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([name, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeploymentBranchPolicyNamePatternWithType &&
        name == other.name &&
        type == other.type;
  }
}
