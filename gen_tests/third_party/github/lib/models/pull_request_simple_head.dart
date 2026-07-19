import 'package:github/model_helpers.dart';
import 'package:github/models/repository.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestSimpleHead {
  const PullRequestSimpleHead({
    required this.label,
    required this.ref,
    required this.repo,
    required this.sha,
    required this.user,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestSimpleHead].
  factory PullRequestSimpleHead.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestSimpleHead',
      json,
      () => PullRequestSimpleHead(
        label: json['label'] as String,
        ref: json['ref'] as String,
        repo: Repository.fromJson(json['repo'] as Map<String, dynamic>),
        sha: json['sha'] as String,
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestSimpleHead? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestSimpleHead.fromJson(json);
  }

  final String label;
  final String ref;

  /// Repository
  /// A repository on GitHub.
  final Repository repo;
  final String sha;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;

  /// Converts a [PullRequestSimpleHead] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'ref': ref,
      'repo': repo.toJson(),
      'sha': sha,
      'user': user?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([label, ref, repo, sha, user]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestSimpleHead &&
        label == other.label &&
        ref == other.ref &&
        repo == other.repo &&
        sha == other.sha &&
        user == other.user;
  }
}
