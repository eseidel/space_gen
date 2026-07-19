import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repository_rule_params_workflow_file_reference}
/// WorkflowFileReference
/// A workflow that must run for this rule to pass
/// {@endtemplate}
@immutable
class RepositoryRuleParamsWorkflowFileReference {
  /// {@macro repository_rule_params_workflow_file_reference}
  const RepositoryRuleParamsWorkflowFileReference({
    required this.path,
    required this.repositoryId,
    this.ref,
    this.sha,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleParamsWorkflowFileReference].
  factory RepositoryRuleParamsWorkflowFileReference.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleParamsWorkflowFileReference',
      json,
      () => RepositoryRuleParamsWorkflowFileReference(
        path: json['path'] as String,
        ref: json['ref'] as String?,
        repositoryId: json['repository_id'] as int,
        sha: json['sha'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleParamsWorkflowFileReference? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleParamsWorkflowFileReference.fromJson(json);
  }

  /// The path to the workflow file
  final String path;

  /// The ref (branch or tag) of the workflow file to use
  final String? ref;

  /// The ID of the repository where the workflow is defined
  final int repositoryId;

  /// The commit SHA of the workflow file to use
  final String? sha;

  /// Converts a [RepositoryRuleParamsWorkflowFileReference]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      if (ref != null) 'ref': ref,
      'repository_id': repositoryId,
      if (sha != null) 'sha': sha,
    };
  }

  @override
  int get hashCode => Object.hashAll([path, ref, repositoryId, sha]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleParamsWorkflowFileReference &&
        path == other.path &&
        ref == other.ref &&
        repositoryId == other.repositoryId &&
        sha == other.sha;
  }
}
