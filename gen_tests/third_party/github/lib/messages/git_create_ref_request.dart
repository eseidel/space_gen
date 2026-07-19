import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GitCreateRefRequest {
  const GitCreateRefRequest({required this.ref, required this.sha});

  /// Converts a `Map<String, dynamic>` to a [GitCreateRefRequest].
  factory GitCreateRefRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitCreateRefRequest',
      json,
      () => GitCreateRefRequest(
        ref: json['ref'] as String,
        sha: json['sha'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCreateRefRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitCreateRefRequest.fromJson(json);
  }

  /// The name of the fully qualified reference (ie: `refs/heads/master`). If
  /// it doesn't start with 'refs' and have at least two slashes, it will be
  /// rejected.
  final String ref;

  /// The SHA1 value for this reference.
  final String sha;

  /// Converts a [GitCreateRefRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'ref': ref, 'sha': sha};
  }

  @override
  int get hashCode => Object.hashAll([ref, sha]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCreateRefRequest && ref == other.ref && sha == other.sha;
  }
}
