// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/diff_entry_status.dart';
import 'package:meta/meta.dart';

/// {@template diff_entry}
/// Diff Entry
/// Diff Entry
/// {@endtemplate}
@immutable
class DiffEntry {
  /// {@macro diff_entry}
  const DiffEntry({
    required this.sha,
    required this.filename,
    required this.status,
    required this.additions,
    required this.deletions,
    required this.changes,
    required this.blobUrl,
    required this.rawUrl,
    required this.contentsUrl,
    this.patch,
    this.previousFilename,
  });

  /// Converts a `Map<String, dynamic>` to a [DiffEntry].
  factory DiffEntry.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DiffEntry',
      json,
      () => DiffEntry(
        sha: json['sha'] as String,
        filename: json['filename'] as String,
        status: DiffEntryStatus.fromJson(json['status'] as String),
        additions: json['additions'] as int,
        deletions: json['deletions'] as int,
        changes: json['changes'] as int,
        blobUrl: Uri.parse(json['blob_url'] as String),
        rawUrl: Uri.parse(json['raw_url'] as String),
        contentsUrl: Uri.parse(json['contents_url'] as String),
        patch: json['patch'] as String?,
        previousFilename: json['previous_filename'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DiffEntry? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DiffEntry.fromJson(json);
  }

  /// Example: `'bbcd538c8e72b8c175046e27cc8f907076331401'`
  final String sha;

  /// Example: `'file1.txt'`
  final String filename;

  /// Example: `'added'`
  final DiffEntryStatus status;

  /// Example: `103`
  final int additions;

  /// Example: `21`
  final int deletions;

  /// Example: `124`
  final int changes;

  /// Example:
  /// `'https://github.com/octocat/Hello-World/blob/6dcb09b5b57875f334f61aebed695e2e4193db5e/file1.txt'`
  final Uri blobUrl;

  /// Example:
  /// `'https://github.com/octocat/Hello-World/raw/6dcb09b5b57875f334f61aebed695e2e4193db5e/file1.txt'`
  final Uri rawUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/contents/file1.txt?ref=6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final Uri contentsUrl;

  /// Example: `'@@ -132,7 +132,7 @@ module Test @@ -1000,7 +1000,7 @@ module Test'`
  final String? patch;

  /// Example: `'file.txt'`
  final String? previousFilename;

  /// Converts a [DiffEntry] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'sha': sha,
      'filename': filename,
      'status': status.toJson(),
      'additions': additions,
      'deletions': deletions,
      'changes': changes,
      'blob_url': blobUrl.toString(),
      'raw_url': rawUrl.toString(),
      'contents_url': contentsUrl.toString(),
      if (patch != null) 'patch': patch,
      if (previousFilename != null) 'previous_filename': previousFilename,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    sha,
    filename,
    status,
    additions,
    deletions,
    changes,
    blobUrl,
    rawUrl,
    contentsUrl,
    patch,
    previousFilename,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DiffEntry &&
        sha == other.sha &&
        filename == other.filename &&
        status == other.status &&
        additions == other.additions &&
        deletions == other.deletions &&
        changes == other.changes &&
        blobUrl == other.blobUrl &&
        rawUrl == other.rawUrl &&
        contentsUrl == other.contentsUrl &&
        patch == other.patch &&
        previousFilename == other.previousFilename;
  }
}
