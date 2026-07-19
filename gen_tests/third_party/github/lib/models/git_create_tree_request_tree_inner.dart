import 'package:github/model_helpers.dart';
import 'package:github/models/git_create_tree_request_tree_inner_mode.dart';
import 'package:github/models/git_create_tree_request_tree_inner_type.dart';
import 'package:meta/meta.dart';

@immutable
class GitCreateTreeRequestTreeInner {
  const GitCreateTreeRequestTreeInner({
    this.path,
    this.mode,
    this.type,
    this.sha,
    this.content,
  });

  /// Converts a `Map<String, dynamic>` to a [GitCreateTreeRequestTreeInner].
  factory GitCreateTreeRequestTreeInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitCreateTreeRequestTreeInner',
      json,
      () => GitCreateTreeRequestTreeInner(
        path: json['path'] as String?,
        mode: GitCreateTreeRequestTreeInnerMode.maybeFromJson(
          json['mode'] as String?,
        ),
        type: GitCreateTreeRequestTreeInnerType.maybeFromJson(
          json['type'] as String?,
        ),
        sha: json['sha'] as String?,
        content: json['content'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCreateTreeRequestTreeInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GitCreateTreeRequestTreeInner.fromJson(json);
  }

  /// The file referenced in the tree.
  final String? path;

  /// The file mode; one of `100644` for file (blob), `100755` for executable
  /// (blob), `040000` for subdirectory (tree), `160000` for submodule
  /// (commit), or `120000` for a blob that specifies the path of a symlink.
  final GitCreateTreeRequestTreeInnerMode? mode;

  /// Either `blob`, `tree`, or `commit`.
  final GitCreateTreeRequestTreeInnerType? type;

  /// The SHA1 checksum ID of the object in the tree. Also called `tree.sha`.
  /// If the value is `null` then the file will be deleted.
  ///
  /// **Note:** Use either `tree.sha` or `content` to specify the contents of
  /// the entry. Using both `tree.sha` and `content` will return an error.
  final String? sha;

  /// The content you want this file to have. GitHub will write this blob out
  /// and use that SHA for this entry. Use either this, or `tree.sha`.
  ///
  /// **Note:** Use either `tree.sha` or `content` to specify the contents of
  /// the entry. Using both `tree.sha` and `content` will return an error.
  final String? content;

  /// Converts a [GitCreateTreeRequestTreeInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'mode': mode?.toJson(),
      'type': type?.toJson(),
      'sha': sha,
      'content': content,
    };
  }

  @override
  int get hashCode => Object.hashAll([path, mode, type, sha, content]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCreateTreeRequestTreeInner &&
        path == other.path &&
        mode == other.mode &&
        type == other.type &&
        sha == other.sha &&
        content == other.content;
  }
}
