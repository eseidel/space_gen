// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_wiki_commit}
/// Represents a 'wiki_commit' secret scanning location type. This location type
/// shows that a secret was detected inside a commit to a repository wiki.
/// {@endtemplate}
@immutable
class SecretScanningLocationWikiCommit {
  /// {@macro secret_scanning_location_wiki_commit}
  const SecretScanningLocationWikiCommit({
    required this.path,
    required this.startLine,
    required this.endLine,
    required this.startColumn,
    required this.endColumn,
    required this.blobSha,
    required this.pageUrl,
    required this.commitSha,
    required this.commitUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [SecretScanningLocationWikiCommit].
  factory SecretScanningLocationWikiCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecretScanningLocationWikiCommit',
      json,
      () => SecretScanningLocationWikiCommit(
        path: json['path'] as String,
        startLine: (json['start_line'] as num).toDouble(),
        endLine: (json['end_line'] as num).toDouble(),
        startColumn: (json['start_column'] as num).toDouble(),
        endColumn: (json['end_column'] as num).toDouble(),
        blobSha: json['blob_sha'] as String,
        pageUrl: json['page_url'] as String,
        commitSha: json['commit_sha'] as String,
        commitUrl: json['commit_url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationWikiCommit? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationWikiCommit.fromJson(json);
  }

  /// The file path of the wiki page
  /// Example: `'/example/Home.md'`
  final String path;

  /// Line number at which the secret starts in the file
  final double startLine;

  /// Line number at which the secret ends in the file
  final double endLine;

  /// The column at which the secret starts within the start line when the
  /// file is interpreted as 8-bit ASCII.
  final double startColumn;

  /// The column at which the secret ends within the end line when the file is
  /// interpreted as 8-bit ASCII.
  final double endColumn;

  /// SHA-1 hash ID of the associated blob
  /// Example: `'af5626b4a114abcb82d63db7c8082c3c4756e51b'`
  final String blobSha;

  /// The GitHub URL to get the associated wiki page
  /// Example:
  /// `'https://github.com/octocat/Hello-World/wiki/Home/302c0b7e200761c9dd9b57e57db540ee0b4293a5'`
  final String pageUrl;

  /// SHA-1 hash ID of the associated commit
  /// Example: `'302c0b7e200761c9dd9b57e57db540ee0b4293a5'`
  final String commitSha;

  /// The GitHub URL to get the associated wiki commit
  /// Example:
  /// `'https://github.com/octocat/Hello-World/wiki/_compare/302c0b7e200761c9dd9b57e57db540ee0b4293a5'`
  final String commitUrl;

  /// Converts a [SecretScanningLocationWikiCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'start_line': startLine,
      'end_line': endLine,
      'start_column': startColumn,
      'end_column': endColumn,
      'blob_sha': blobSha,
      'page_url': pageUrl,
      'commit_sha': commitSha,
      'commit_url': commitUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    path,
    startLine,
    endLine,
    startColumn,
    endColumn,
    blobSha,
    pageUrl,
    commitSha,
    commitUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationWikiCommit &&
        path == other.path &&
        startLine == other.startLine &&
        endLine == other.endLine &&
        startColumn == other.startColumn &&
        endColumn == other.endColumn &&
        blobSha == other.blobSha &&
        pageUrl == other.pageUrl &&
        commitSha == other.commitSha &&
        commitUrl == other.commitUrl;
  }
}
