import 'package:github/model_helpers.dart';
import 'package:github/models/git_create_tree_request_tree_inner.dart';
import 'package:meta/meta.dart';

@immutable
class GitCreateTreeRequest {
  const GitCreateTreeRequest({required this.tree, this.baseTree});

  /// Converts a `Map<String, dynamic>` to a [GitCreateTreeRequest].
  factory GitCreateTreeRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitCreateTreeRequest',
      json,
      () => GitCreateTreeRequest(
        tree: (json['tree'] as List)
            .map<GitCreateTreeRequestTreeInner>(
              (e) => GitCreateTreeRequestTreeInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        baseTree: json['base_tree'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCreateTreeRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitCreateTreeRequest.fromJson(json);
  }

  /// Objects (of `path`, `mode`, `type`, and `sha`) specifying a tree
  /// structure.
  final List<GitCreateTreeRequestTreeInner> tree;

  /// The SHA1 of an existing Git tree object which will be used as the base
  /// for the new tree. If provided, a new Git tree object will be created
  /// from entries in the Git tree object pointed to by `base_tree` and
  /// entries defined in the `tree` parameter. Entries defined in the `tree`
  /// parameter will overwrite items from `base_tree` with the same `path`. If
  /// you're creating new changes on a branch, then normally you'd set
  /// `base_tree` to the SHA1 of the Git tree object of the current latest
  /// commit on the branch you're working on.
  /// If not provided, GitHub will create a new Git tree object from only the
  /// entries defined in the `tree` parameter. If you create a new commit
  /// pointing to such a tree, then all files which were a part of the parent
  /// commit's tree and were not defined in the `tree` parameter will be
  /// listed as deleted by the new commit.
  final String? baseTree;

  /// Converts a [GitCreateTreeRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'tree': tree.map((e) => e.toJson()).toList(),
      'base_tree': baseTree,
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(tree), baseTree]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCreateTreeRequest &&
        listsEqual(tree, other.tree) &&
        baseTree == other.baseTree;
  }
}
