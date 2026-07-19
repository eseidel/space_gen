import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ArtifactWorkflowRun {
  const ArtifactWorkflowRun({
    this.id,
    this.repositoryId,
    this.headRepositoryId,
    this.headBranch,
    this.headSha,
  });

  /// Converts a `Map<String, dynamic>` to an [ArtifactWorkflowRun].
  factory ArtifactWorkflowRun.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ArtifactWorkflowRun',
      json,
      () => ArtifactWorkflowRun(
        id: json['id'] as int?,
        repositoryId: json['repository_id'] as int?,
        headRepositoryId: json['head_repository_id'] as int?,
        headBranch: json['head_branch'] as String?,
        headSha: json['head_sha'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ArtifactWorkflowRun? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ArtifactWorkflowRun.fromJson(json);
  }

  /// Example: `10`
  final int? id;

  /// Example: `42`
  final int? repositoryId;

  /// Example: `42`
  final int? headRepositoryId;

  /// Example: `'main'`
  final String? headBranch;

  /// Example: `'009b8a3a9ccbb128af87f9b1c0f4c62e8a304f6d'`
  final String? headSha;

  /// Converts an [ArtifactWorkflowRun] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (repositoryId != null) 'repository_id': repositoryId,
      if (headRepositoryId != null) 'head_repository_id': headRepositoryId,
      if (headBranch != null) 'head_branch': headBranch,
      if (headSha != null) 'head_sha': headSha,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, repositoryId, headRepositoryId, headBranch, headSha]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ArtifactWorkflowRun &&
        id == other.id &&
        repositoryId == other.repositoryId &&
        headRepositoryId == other.headRepositoryId &&
        headBranch == other.headBranch &&
        headSha == other.headSha;
  }
}
