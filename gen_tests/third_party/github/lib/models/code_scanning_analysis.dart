import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_analysis_analysis_key.dart';
import 'package:github/models/code_scanning_analysis_category.dart';
import 'package:github/models/code_scanning_analysis_commit_sha.dart';
import 'package:github/models/code_scanning_analysis_created_at.dart';
import 'package:github/models/code_scanning_analysis_environment.dart';
import 'package:github/models/code_scanning_analysis_sarif_id.dart';
import 'package:github/models/code_scanning_analysis_tool.dart';
import 'package:github/models/code_scanning_analysis_url.dart';
import 'package:github/models/code_scanning_ref.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningAnalysis {
  const CodeScanningAnalysis({
    required this.ref,
    required this.commitSha,
    required this.analysisKey,
    required this.environment,
    required this.error,
    required this.createdAt,
    required this.resultsCount,
    required this.rulesCount,
    required this.id,
    required this.url,
    required this.sarifId,
    required this.tool,
    required this.deletable,
    required this.warning,
    this.category,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningAnalysis].
  factory CodeScanningAnalysis.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningAnalysis',
      json,
      () => CodeScanningAnalysis(
        ref: CodeScanningRef.fromJson(json['ref'] as String),
        commitSha: CodeScanningAnalysisCommitSha.fromJson(
          json['commit_sha'] as String,
        ),
        analysisKey: CodeScanningAnalysisAnalysisKey.fromJson(
          json['analysis_key'] as String,
        ),
        environment: CodeScanningAnalysisEnvironment.fromJson(
          json['environment'] as String,
        ),
        category: CodeScanningAnalysisCategory.maybeFromJson(
          json['category'] as String?,
        ),
        error: json['error'] as String,
        createdAt: CodeScanningAnalysisCreatedAt.fromJson(
          json['created_at'] as String,
        ),
        resultsCount: json['results_count'] as int,
        rulesCount: json['rules_count'] as int,
        id: json['id'] as int,
        url: CodeScanningAnalysisUrl.fromJson(json['url'] as String),
        sarifId: CodeScanningAnalysisSarifId.fromJson(
          json['sarif_id'] as String,
        ),
        tool: CodeScanningAnalysisTool.fromJson(
          json['tool'] as Map<String, dynamic>,
        ),
        deletable: json['deletable'] as bool,
        warning: json['warning'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysis? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysis.fromJson(json);
  }

  /// The Git reference, formatted as `refs/pull/<number>/merge`,
  /// `refs/pull/<number>/head`,
  /// `refs/heads/<branch name>` or simply `<branch name>`.
  final CodeScanningRef ref;

  /// The SHA of the commit to which the analysis you are uploading relates.
  final CodeScanningAnalysisCommitSha commitSha;

  /// Identifies the configuration under which the analysis was executed. For
  /// example, in GitHub Actions this includes the workflow filename and job
  /// name.
  final CodeScanningAnalysisAnalysisKey analysisKey;

  /// Identifies the variable values associated with the environment in which
  /// this analysis was performed.
  final CodeScanningAnalysisEnvironment environment;

  /// Identifies the configuration under which the analysis was executed. Used
  /// to distinguish between multiple analyses for the same tool and commit,
  /// but performed on different languages or different parts of the code.
  final CodeScanningAnalysisCategory? category;

  /// Example: `'error reading field xyz'`
  final String error;

  /// The time that the analysis was created in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final CodeScanningAnalysisCreatedAt createdAt;

  /// The total number of results in the analysis.
  final int resultsCount;

  /// The total number of rules used in the analysis.
  final int rulesCount;

  /// Unique identifier for this analysis.
  final int id;

  /// The REST API URL of the analysis resource.
  final CodeScanningAnalysisUrl url;

  /// An identifier for the upload.
  /// Example: `'6c81cd8e-b078-4ac3-a3be-1dad7dbd0b53'`
  final CodeScanningAnalysisSarifId sarifId;
  final CodeScanningAnalysisTool tool;
  final bool deletable;

  /// Warning generated when processing the analysis
  /// Example: `'123 results were ignored'`
  final String warning;

  /// Converts a [CodeScanningAnalysis] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'ref': ref.toJson(),
      'commit_sha': commitSha.toJson(),
      'analysis_key': analysisKey.toJson(),
      'environment': environment.toJson(),
      'category': category?.toJson(),
      'error': error,
      'created_at': createdAt.toJson(),
      'results_count': resultsCount,
      'rules_count': rulesCount,
      'id': id,
      'url': url.toJson(),
      'sarif_id': sarifId.toJson(),
      'tool': tool.toJson(),
      'deletable': deletable,
      'warning': warning,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    ref,
    commitSha,
    analysisKey,
    environment,
    category,
    error,
    createdAt,
    resultsCount,
    rulesCount,
    id,
    url,
    sarifId,
    tool,
    deletable,
    warning,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningAnalysis &&
        ref == other.ref &&
        commitSha == other.commitSha &&
        analysisKey == other.analysisKey &&
        environment == other.environment &&
        category == other.category &&
        error == other.error &&
        createdAt == other.createdAt &&
        resultsCount == other.resultsCount &&
        rulesCount == other.rulesCount &&
        id == other.id &&
        url == other.url &&
        sarifId == other.sarifId &&
        tool == other.tool &&
        deletable == other.deletable &&
        warning == other.warning;
  }
}
