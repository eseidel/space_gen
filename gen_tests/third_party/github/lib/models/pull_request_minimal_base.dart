import 'package:github/model_helpers.dart';
import 'package:github/models/pull_request_minimal_base_repo.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestMinimalBase {
  const PullRequestMinimalBase({
    required this.ref,
    required this.sha,
    required this.repo,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestMinimalBase].
  factory PullRequestMinimalBase.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestMinimalBase',
      json,
      () => PullRequestMinimalBase(
        ref: json['ref'] as String,
        sha: json['sha'] as String,
        repo: PullRequestMinimalBaseRepo.fromJson(
          json['repo'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestMinimalBase? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestMinimalBase.fromJson(json);
  }

  final String ref;
  final String sha;
  final PullRequestMinimalBaseRepo repo;

  /// Converts a [PullRequestMinimalBase] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'ref': ref, 'sha': sha, 'repo': repo.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([ref, sha, repo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestMinimalBase &&
        ref == other.ref &&
        sha == other.sha &&
        repo == other.repo;
  }
}
