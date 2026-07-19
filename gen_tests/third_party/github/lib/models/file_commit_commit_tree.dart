import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class FileCommitCommitTree {
  const FileCommitCommitTree({this.url, this.sha});

  /// Converts a `Map<String, dynamic>` to a [FileCommitCommitTree].
  factory FileCommitCommitTree.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FileCommitCommitTree',
      json,
      () => FileCommitCommitTree(
        url: json['url'] as String?,
        sha: json['sha'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileCommitCommitTree? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FileCommitCommitTree.fromJson(json);
  }

  final String? url;
  final String? sha;

  /// Converts a [FileCommitCommitTree] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'url': ?url, 'sha': ?sha};
  }

  @override
  int get hashCode => Object.hashAll([url, sha]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileCommitCommitTree &&
        url == other.url &&
        sha == other.sha;
  }
}
