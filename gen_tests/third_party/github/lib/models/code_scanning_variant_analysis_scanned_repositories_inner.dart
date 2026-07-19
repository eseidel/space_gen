import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_variant_analysis_repository.dart';
import 'package:github/models/code_scanning_variant_analysis_status.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningVariantAnalysisScannedRepositoriesInner {
  const CodeScanningVariantAnalysisScannedRepositoriesInner({
    required this.repository,
    required this.analysisStatus,
    this.resultCount,
    this.artifactSizeInBytes,
    this.failureMessage,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeScanningVariantAnalysisScannedRepositoriesInner].
  factory CodeScanningVariantAnalysisScannedRepositoriesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeScanningVariantAnalysisScannedRepositoriesInner',
      json,
      () => CodeScanningVariantAnalysisScannedRepositoriesInner(
        repository: CodeScanningVariantAnalysisRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
        analysisStatus: CodeScanningVariantAnalysisStatus.fromJson(
          json['analysis_status'] as String,
        ),
        resultCount: json['result_count'] as int?,
        artifactSizeInBytes: json['artifact_size_in_bytes'] as int?,
        failureMessage: json['failure_message'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningVariantAnalysisScannedRepositoriesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningVariantAnalysisScannedRepositoriesInner.fromJson(json);
  }

  /// Repository Identifier
  /// Repository Identifier
  final CodeScanningVariantAnalysisRepository repository;

  /// The new status of the CodeQL variant analysis repository task.
  final CodeScanningVariantAnalysisStatus analysisStatus;

  /// The number of results in the case of a successful analysis. This is only
  /// available for successful analyses.
  final int? resultCount;

  /// The size of the artifact. This is only available for successful
  /// analyses.
  final int? artifactSizeInBytes;

  /// The reason of the failure of this repo task. This is only available if
  /// the repository task has failed.
  final String? failureMessage;

  /// Converts a [CodeScanningVariantAnalysisScannedRepositoriesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'repository': repository.toJson(),
      'analysis_status': analysisStatus.toJson(),
      'result_count': resultCount,
      'artifact_size_in_bytes': artifactSizeInBytes,
      'failure_message': failureMessage,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    repository,
    analysisStatus,
    resultCount,
    artifactSizeInBytes,
    failureMessage,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningVariantAnalysisScannedRepositoriesInner &&
        repository == other.repository &&
        analysisStatus == other.analysisStatus &&
        resultCount == other.resultCount &&
        artifactSizeInBytes == other.artifactSizeInBytes &&
        failureMessage == other.failureMessage;
  }
}
