import 'package:github/model_helpers.dart';
import 'package:github/models/file_commit_commit.dart';
import 'package:github/models/file_commit_content.dart';
import 'package:meta/meta.dart';

/// {@template file_commit}
/// File Commit
/// File Commit
/// {@endtemplate}
@immutable
class FileCommit {
  /// {@macro file_commit}
  const FileCommit({required this.content, required this.commit});

  /// Converts a `Map<String, dynamic>` to a [FileCommit].
  factory FileCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FileCommit',
      json,
      () => FileCommit(
        content: FileCommitContent.maybeFromJson(
          checkedKey(json, 'content') as Map<String, dynamic>?,
        ),
        commit: FileCommitCommit.fromJson(
          json['commit'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileCommit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FileCommit.fromJson(json);
  }

  final FileCommitContent? content;
  final FileCommitCommit commit;

  /// Converts a [FileCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'content': content?.toJson(), 'commit': commit.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([content, commit]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileCommit &&
        content == other.content &&
        commit == other.commit;
  }
}
