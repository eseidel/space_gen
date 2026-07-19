import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_variant_analysis_status.dart';
import 'package:github/models/simple_repository.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningVariantAnalysisRepoTask {
  const CodeScanningVariantAnalysisRepoTask({
    required this.repository,
    required this.analysisStatus,
    this.artifactSizeInBytes,
    this.resultCount,
    this.failureMessage,
    this.databaseCommitSha,
    this.sourceLocationPrefix,
    this.artifactUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeScanningVariantAnalysisRepoTask].
  factory CodeScanningVariantAnalysisRepoTask.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeScanningVariantAnalysisRepoTask',
      json,
      () => CodeScanningVariantAnalysisRepoTask(
        repository: SimpleRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
        analysisStatus: CodeScanningVariantAnalysisStatus.fromJson(
          json['analysis_status'] as String,
        ),
        artifactSizeInBytes: json['artifact_size_in_bytes'] as int?,
        resultCount: json['result_count'] as int?,
        failureMessage: json['failure_message'] as String?,
        databaseCommitSha: json['database_commit_sha'] as String?,
        sourceLocationPrefix: json['source_location_prefix'] as String?,
        artifactUrl: json['artifact_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningVariantAnalysisRepoTask? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningVariantAnalysisRepoTask.fromJson(json);
  }

  /// Simple Repository
  /// A GitHub repository.
  final SimpleRepository repository;

  /// The new status of the CodeQL variant analysis repository task.
  final CodeScanningVariantAnalysisStatus analysisStatus;

  /// The size of the artifact. This is only available for successful
  /// analyses.
  final int? artifactSizeInBytes;

  /// The number of results in the case of a successful analysis. This is only
  /// available for successful analyses.
  final int? resultCount;

  /// The reason of the failure of this repo task. This is only available if
  /// the repository task has failed.
  final String? failureMessage;

  /// The SHA of the commit the CodeQL database was built against. This is
  /// only available for successful analyses.
  final String? databaseCommitSha;

  /// The source location prefix to use. This is only available for successful
  /// analyses.
  final String? sourceLocationPrefix;

  /// The URL of the artifact. This is only available for successful analyses.
  final String? artifactUrl;

  /// Converts a [CodeScanningVariantAnalysisRepoTask]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'repository': repository.toJson(),
      'analysis_status': analysisStatus.toJson(),
      'artifact_size_in_bytes': ?artifactSizeInBytes,
      'result_count': ?resultCount,
      'failure_message': ?failureMessage,
      'database_commit_sha': ?databaseCommitSha,
      'source_location_prefix': ?sourceLocationPrefix,
      'artifact_url': ?artifactUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    repository,
    analysisStatus,
    artifactSizeInBytes,
    resultCount,
    failureMessage,
    databaseCommitSha,
    sourceLocationPrefix,
    artifactUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningVariantAnalysisRepoTask &&
        repository == other.repository &&
        analysisStatus == other.analysisStatus &&
        artifactSizeInBytes == other.artifactSizeInBytes &&
        resultCount == other.resultCount &&
        failureMessage == other.failureMessage &&
        databaseCommitSha == other.databaseCommitSha &&
        sourceLocationPrefix == other.sourceLocationPrefix &&
        artifactUrl == other.artifactUrl;
  }
}
