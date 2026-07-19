import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template code_scanning_analysis_deletion}
/// Analysis deletion
/// Successful deletion of a code scanning analysis
/// {@endtemplate}
@immutable
class CodeScanningAnalysisDeletion {
  /// {@macro code_scanning_analysis_deletion}
  const CodeScanningAnalysisDeletion({
    required this.nextAnalysisUrl,
    required this.confirmDeleteUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningAnalysisDeletion].
  factory CodeScanningAnalysisDeletion.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningAnalysisDeletion',
      json,
      () => CodeScanningAnalysisDeletion(
        nextAnalysisUrl: maybeParseUri(
          checkedKey(json, 'next_analysis_url') as String?,
        ),
        confirmDeleteUrl: maybeParseUri(
          checkedKey(json, 'confirm_delete_url') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisDeletion? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisDeletion.fromJson(json);
  }

  /// Next deletable analysis in chain, without last analysis deletion
  /// confirmation
  final Uri? nextAnalysisUrl;

  /// Next deletable analysis in chain, with last analysis deletion
  /// confirmation
  final Uri? confirmDeleteUrl;

  /// Converts a [CodeScanningAnalysisDeletion] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'next_analysis_url': nextAnalysisUrl?.toString(),
      'confirm_delete_url': confirmDeleteUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([nextAnalysisUrl, confirmDeleteUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningAnalysisDeletion &&
        nextAnalysisUrl == other.nextAnalysisUrl &&
        confirmDeleteUrl == other.confirmDeleteUrl;
  }
}
