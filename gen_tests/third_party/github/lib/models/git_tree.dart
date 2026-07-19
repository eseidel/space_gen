// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/git_tree_tree_inner.dart';
import 'package:meta/meta.dart';

/// {@template git_tree}
/// Git Tree
/// The hierarchy between files in a Git repository.
/// {@endtemplate}
@immutable
class GitTree {
  /// {@macro git_tree}
  const GitTree({
    required this.sha,
    required this.truncated,
    required this.tree,
    this.url,
  });

  /// Converts a `Map<String, dynamic>` to a [GitTree].
  factory GitTree.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitTree',
      json,
      () => GitTree(
        sha: json['sha'] as String,
        url: maybeParseUri(json['url'] as String?),
        truncated: json['truncated'] as bool,
        tree: (json['tree'] as List)
            .map<GitTreeTreeInner>(
              (e) => GitTreeTreeInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitTree? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitTree.fromJson(json);
  }

  final String sha;
  final Uri? url;
  final bool truncated;

  /// Objects specifying a tree structure
  /// Example:
  /// ```json
  /// {
  ///   "path": "file.rb",
  ///   "mode": "100644",
  ///   "type": "blob",
  ///   "size": 30,
  ///   "sha": "44b4fc6d56897b048c772eb4087f854f46256132",
  ///   "url": "https://api.github.com/repos/octocat/Hello-World/git/blobs/44b4fc6d56897b048c772eb4087f854f46256132"
  /// }
  /// ```
  final List<GitTreeTreeInner> tree;

  /// Converts a [GitTree] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'sha': sha,
      if (url != null) 'url': url?.toString(),
      'truncated': truncated,
      'tree': tree.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([sha, url, truncated, listHash(tree)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitTree &&
        sha == other.sha &&
        url == other.url &&
        truncated == other.truncated &&
        listsEqual(tree, other.tree);
  }
}
