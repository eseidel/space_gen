import 'package:github/model_helpers.dart';
import 'package:github/models/artifact.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListWorkflowRunArtifacts200Response {
  const ActionsListWorkflowRunArtifacts200Response({
    required this.totalCount,
    required this.artifacts,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListWorkflowRunArtifacts200Response].
  factory ActionsListWorkflowRunArtifacts200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListWorkflowRunArtifacts200Response',
      json,
      () => ActionsListWorkflowRunArtifacts200Response(
        totalCount: json['total_count'] as int,
        artifacts: (json['artifacts'] as List)
            .map<Artifact>((e) => Artifact.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListWorkflowRunArtifacts200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListWorkflowRunArtifacts200Response.fromJson(json);
  }

  final int totalCount;
  final List<Artifact> artifacts;

  /// Converts an [ActionsListWorkflowRunArtifacts200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'artifacts': artifacts.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(artifacts)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsListWorkflowRunArtifacts200Response &&
        totalCount == other.totalCount &&
        listsEqual(artifacts, other.artifacts);
  }
}
