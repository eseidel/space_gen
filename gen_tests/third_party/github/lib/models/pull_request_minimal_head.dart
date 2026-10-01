// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:github/models/pull_request_minimal_head_repo.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestMinimalHead {
  const PullRequestMinimalHead({
    required this.ref,
    required this.sha,
    required this.repo,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestMinimalHead].
  factory PullRequestMinimalHead.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestMinimalHead',
      json,
      () => PullRequestMinimalHead(
        ref: json['ref'] as String,
        sha: json['sha'] as String,
        repo: PullRequestMinimalHeadRepo.fromJson(
          json['repo'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestMinimalHead? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestMinimalHead.fromJson(json);
  }

  final String ref;
  final String sha;
  final PullRequestMinimalHeadRepo repo;

  /// Converts a [PullRequestMinimalHead] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'ref': ref, 'sha': sha, 'repo': repo.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([ref, sha, repo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestMinimalHead &&
        ref == other.ref &&
        sha == other.sha &&
        repo == other.repo;
  }
}
