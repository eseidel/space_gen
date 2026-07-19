import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_commit}
/// Represents a 'commit' secret scanning location type. This location type
/// shows that a secret was detected inside a commit to a repository.
/// {@endtemplate}
@immutable
class SecretScanningLocationCommit {
  /// {@macro secret_scanning_location_commit}
  const SecretScanningLocationCommit({
    required this.path,
    required this.startLine,
    required this.endLine,
    required this.startColumn,
    required this.endColumn,
    required this.blobSha,
    required this.blobUrl,
    required this.commitSha,
    required this.commitUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [SecretScanningLocationCommit].
  factory SecretScanningLocationCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecretScanningLocationCommit',
      json,
      () => SecretScanningLocationCommit(
        path: json['path'] as String,
        startLine: (json['start_line'] as num).toDouble(),
        endLine: (json['end_line'] as num).toDouble(),
        startColumn: (json['start_column'] as num).toDouble(),
        endColumn: (json['end_column'] as num).toDouble(),
        blobSha: json['blob_sha'] as String,
        blobUrl: json['blob_url'] as String,
        commitSha: json['commit_sha'] as String,
        commitUrl: json['commit_url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationCommit? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationCommit.fromJson(json);
  }

  /// The file path in the repository
  /// Example: `'/example/secrets.txt'`
  final String path;

  /// Line number at which the secret starts in the file
  final double startLine;

  /// Line number at which the secret ends in the file
  final double endLine;

  /// The column at which the secret starts within the start line when the
  /// file is interpreted as 8BIT ASCII
  final double startColumn;

  /// The column at which the secret ends within the end line when the file is
  /// interpreted as 8BIT ASCII
  final double endColumn;

  /// SHA-1 hash ID of the associated blob
  /// Example: `'af5626b4a114abcb82d63db7c8082c3c4756e51b'`
  final String blobSha;

  /// The API URL to get the associated blob resource
  final String blobUrl;

  /// SHA-1 hash ID of the associated commit
  /// Example: `'af5626b4a114abcb82d63db7c8082c3c4756e51b'`
  final String commitSha;

  /// The API URL to get the associated commit resource
  final String commitUrl;

  /// Converts a [SecretScanningLocationCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'start_line': startLine,
      'end_line': endLine,
      'start_column': startColumn,
      'end_column': endColumn,
      'blob_sha': blobSha,
      'blob_url': blobUrl,
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
    blobUrl,
    commitSha,
    commitUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationCommit &&
        path == other.path &&
        startLine == other.startLine &&
        endLine == other.endLine &&
        startColumn == other.startColumn &&
        endColumn == other.endColumn &&
        blobSha == other.blobSha &&
        blobUrl == other.blobUrl &&
        commitSha == other.commitSha &&
        commitUrl == other.commitUrl;
  }
}
