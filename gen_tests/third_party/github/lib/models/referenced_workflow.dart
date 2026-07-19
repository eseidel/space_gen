import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template referenced_workflow}
/// Referenced workflow
/// A workflow referenced/reused by the initial caller workflow
/// {@endtemplate}
@immutable
class ReferencedWorkflow {
  /// {@macro referenced_workflow}
  const ReferencedWorkflow({required this.path, required this.sha, this.ref});

  /// Converts a `Map<String, dynamic>` to a [ReferencedWorkflow].
  factory ReferencedWorkflow.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReferencedWorkflow',
      json,
      () => ReferencedWorkflow(
        path: json['path'] as String,
        sha: json['sha'] as String,
        ref: json['ref'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReferencedWorkflow? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReferencedWorkflow.fromJson(json);
  }

  final String path;
  final String sha;
  final String? ref;

  /// Converts a [ReferencedWorkflow] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'path': path, 'sha': sha, 'ref': ?ref};
  }

  @override
  int get hashCode => Object.hashAll([path, sha, ref]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReferencedWorkflow &&
        path == other.path &&
        sha == other.sha &&
        ref == other.ref;
  }
}
