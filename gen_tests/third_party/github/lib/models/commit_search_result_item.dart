import 'package:github/model_helpers.dart';
import 'package:github/models/commit_search_result_item_commit.dart';
import 'package:github/models/commit_search_result_item_parents_inner.dart';
import 'package:github/models/git_user.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/search_result_text_matches_inner.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template commit_search_result_item}
/// Commit Search Result Item
/// Commit Search Result Item
/// {@endtemplate}
@immutable
class CommitSearchResultItem {
  /// {@macro commit_search_result_item}
  const CommitSearchResultItem({
    required this.url,
    required this.sha,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.commit,
    required this.author,
    required this.committer,
    required this.parents,
    required this.repository,
    required this.score,
    required this.nodeId,
    this.textMatches,
  });

  /// Converts a `Map<String, dynamic>` to a [CommitSearchResultItem].
  factory CommitSearchResultItem.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommitSearchResultItem',
      json,
      () => CommitSearchResultItem(
        url: Uri.parse(json['url'] as String),
        sha: json['sha'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        commentsUrl: Uri.parse(json['comments_url'] as String),
        commit: CommitSearchResultItemCommit.fromJson(
          json['commit'] as Map<String, dynamic>,
        ),
        author: SimpleUser.maybeFromJson(
          checkedKey(json, 'author') as Map<String, dynamic>?,
        ),
        committer: GitUser.maybeFromJson(
          checkedKey(json, 'committer') as Map<String, dynamic>?,
        ),
        parents: (json['parents'] as List)
            .map<CommitSearchResultItemParentsInner>(
              (e) => CommitSearchResultItemParentsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        repository: MinimalRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
        score: (json['score'] as num).toDouble(),
        nodeId: json['node_id'] as String,
        textMatches: (json['text_matches'] as List?)
            ?.map<SearchResultTextMatchesInner>(
              (e) => SearchResultTextMatchesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitSearchResultItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommitSearchResultItem.fromJson(json);
  }

  final Uri url;
  final String sha;
  final Uri htmlUrl;
  final Uri commentsUrl;
  final CommitSearchResultItemCommit commit;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? author;

  /// Git User
  /// Metaproperties for Git author/committer information.
  final GitUser? committer;
  final List<CommitSearchResultItemParentsInner> parents;

  /// Minimal Repository
  /// Minimal Repository
  final MinimalRepository repository;
  final double score;
  final String nodeId;

  /// Search Result Text Matches
  final List<SearchResultTextMatchesInner>? textMatches;

  /// Converts a [CommitSearchResultItem] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'sha': sha,
      'html_url': htmlUrl.toString(),
      'comments_url': commentsUrl.toString(),
      'commit': commit.toJson(),
      'author': author?.toJson(),
      'committer': committer?.toJson(),
      'parents': parents.map((e) => e.toJson()).toList(),
      'repository': repository.toJson(),
      'score': score,
      'node_id': nodeId,
      'text_matches': ?textMatches?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    sha,
    htmlUrl,
    commentsUrl,
    commit,
    author,
    committer,
    listHash(parents),
    repository,
    score,
    nodeId,
    listHash(textMatches),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitSearchResultItem &&
        url == other.url &&
        sha == other.sha &&
        htmlUrl == other.htmlUrl &&
        commentsUrl == other.commentsUrl &&
        commit == other.commit &&
        author == other.author &&
        committer == other.committer &&
        listsEqual(parents, other.parents) &&
        repository == other.repository &&
        score == other.score &&
        nodeId == other.nodeId &&
        listsEqual(textMatches, other.textMatches);
  }
}
