import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_variant_analysis_failure_reason.dart';
import 'package:github/models/code_scanning_variant_analysis_language.dart';
import 'package:github/models/code_scanning_variant_analysis_scanned_repositories_inner.dart';
import 'package:github/models/code_scanning_variant_analysis_skipped_repositories.dart';
import 'package:github/models/code_scanning_variant_analysis_status_1.dart';
import 'package:github/models/simple_repository.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template code_scanning_variant_analysis}
/// Variant Analysis
/// A run of a CodeQL query against one or more repositories.
/// {@endtemplate}
@immutable
class CodeScanningVariantAnalysis {
  /// {@macro code_scanning_variant_analysis}
  const CodeScanningVariantAnalysis({
    required this.id,
    required this.controllerRepo,
    required this.actor,
    required this.queryLanguage,
    required this.queryPackUrl,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.completedAt,
    this.actionsWorkflowRunId,
    this.failureReason,
    this.scannedRepositories,
    this.skippedRepositories,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningVariantAnalysis].
  factory CodeScanningVariantAnalysis.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningVariantAnalysis',
      json,
      () => CodeScanningVariantAnalysis(
        id: json['id'] as int,
        controllerRepo: SimpleRepository.fromJson(
          json['controller_repo'] as Map<String, dynamic>,
        ),
        actor: SimpleUser.fromJson(json['actor'] as Map<String, dynamic>),
        queryLanguage: CodeScanningVariantAnalysisLanguage.fromJson(
          json['query_language'] as String,
        ),
        queryPackUrl: json['query_pack_url'] as String,
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        updatedAt: maybeParseDateTime(json['updated_at'] as String?),
        completedAt: maybeParseDateTime(json['completed_at'] as String?),
        status: CodeScanningVariantAnalysisStatus1.fromJson(
          json['status'] as String,
        ),
        actionsWorkflowRunId: json['actions_workflow_run_id'] as int?,
        failureReason: CodeScanningVariantAnalysisFailureReason.maybeFromJson(
          json['failure_reason'] as String?,
        ),
        scannedRepositories: (json['scanned_repositories'] as List?)
            ?.map<CodeScanningVariantAnalysisScannedRepositoriesInner>(
              (e) =>
                  CodeScanningVariantAnalysisScannedRepositoriesInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
        skippedRepositories:
            CodeScanningVariantAnalysisSkippedRepositories.maybeFromJson(
              json['skipped_repositories'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningVariantAnalysis? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningVariantAnalysis.fromJson(json);
  }

  /// The ID of the variant analysis.
  final int id;

  /// Simple Repository
  /// A GitHub repository.
  final SimpleRepository controllerRepo;

  /// Simple User
  /// A GitHub user.
  final SimpleUser actor;

  /// The language targeted by the CodeQL query
  final CodeScanningVariantAnalysisLanguage queryLanguage;

  /// The download url for the query pack.
  final String queryPackUrl;

  /// The date and time at which the variant analysis was created, in ISO 8601
  /// format':' YYYY-MM-DDTHH:MM:SSZ.
  final DateTime? createdAt;

  /// The date and time at which the variant analysis was last updated, in ISO
  /// 8601 format':' YYYY-MM-DDTHH:MM:SSZ.
  final DateTime? updatedAt;

  /// The date and time at which the variant analysis was completed, in ISO
  /// 8601 format':' YYYY-MM-DDTHH:MM:SSZ. Will be null if the variant
  /// analysis has not yet completed or this information is not available.
  final DateTime? completedAt;
  final CodeScanningVariantAnalysisStatus1 status;

  /// The GitHub Actions workflow run used to execute this variant analysis.
  /// This is only available if the workflow run has started.
  final int? actionsWorkflowRunId;

  /// The reason for a failure of the variant analysis. This is only available
  /// if the variant analysis has failed.
  final CodeScanningVariantAnalysisFailureReason? failureReason;
  final List<CodeScanningVariantAnalysisScannedRepositoriesInner>?
  scannedRepositories;

  /// Information about repositories that were skipped from processing. This
  /// information is only available to the user that initiated the variant
  /// analysis.
  final CodeScanningVariantAnalysisSkippedRepositories? skippedRepositories;

  /// Converts a [CodeScanningVariantAnalysis] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'controller_repo': controllerRepo.toJson(),
      'actor': actor.toJson(),
      'query_language': queryLanguage.toJson(),
      'query_pack_url': queryPackUrl,
      if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'status': status.toJson(),
      if (actionsWorkflowRunId != null)
        'actions_workflow_run_id': actionsWorkflowRunId,
      if (failureReason != null) 'failure_reason': failureReason?.toJson(),
      if (scannedRepositories != null)
        'scanned_repositories': scannedRepositories
            ?.map((e) => e.toJson())
            .toList(),
      if (skippedRepositories != null)
        'skipped_repositories': skippedRepositories?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    controllerRepo,
    actor,
    queryLanguage,
    queryPackUrl,
    createdAt,
    updatedAt,
    completedAt,
    status,
    actionsWorkflowRunId,
    failureReason,
    listHash(scannedRepositories),
    skippedRepositories,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningVariantAnalysis &&
        id == other.id &&
        controllerRepo == other.controllerRepo &&
        actor == other.actor &&
        queryLanguage == other.queryLanguage &&
        queryPackUrl == other.queryPackUrl &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        completedAt == other.completedAt &&
        status == other.status &&
        actionsWorkflowRunId == other.actionsWorkflowRunId &&
        failureReason == other.failureReason &&
        listsEqual(scannedRepositories, other.scannedRepositories) &&
        skippedRepositories == other.skippedRepositories;
  }
}
