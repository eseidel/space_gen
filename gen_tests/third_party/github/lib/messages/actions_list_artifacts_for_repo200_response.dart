import 'package:github/model_helpers.dart';
import 'package:github/models/artifact.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListArtifactsForRepo200Response {
  const ActionsListArtifactsForRepo200Response({
    required this.totalCount,
    required this.artifacts,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListArtifactsForRepo200Response].
  factory ActionsListArtifactsForRepo200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListArtifactsForRepo200Response',
      json,
      () => ActionsListArtifactsForRepo200Response(
        totalCount: json['total_count'] as int,
        artifacts: (json['artifacts'] as List)
            .map<Artifact>((e) => Artifact.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListArtifactsForRepo200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListArtifactsForRepo200Response.fromJson(json);
  }

  final int totalCount;
  final List<Artifact> artifacts;

  /// Converts an [ActionsListArtifactsForRepo200Response]
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
    return other is ActionsListArtifactsForRepo200Response &&
        totalCount == other.totalCount &&
        listsEqual(artifacts, other.artifacts);
  }
}
