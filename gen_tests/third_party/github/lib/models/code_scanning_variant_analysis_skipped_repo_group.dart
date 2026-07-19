import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_variant_analysis_repository.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningVariantAnalysisSkippedRepoGroup {
  const CodeScanningVariantAnalysisSkippedRepoGroup({
    required this.repositoryCount,
    required this.repositories,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeScanningVariantAnalysisSkippedRepoGroup].
  factory CodeScanningVariantAnalysisSkippedRepoGroup.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeScanningVariantAnalysisSkippedRepoGroup',
      json,
      () => CodeScanningVariantAnalysisSkippedRepoGroup(
        repositoryCount: json['repository_count'] as int,
        repositories: (json['repositories'] as List)
            .map<CodeScanningVariantAnalysisRepository>(
              (e) => CodeScanningVariantAnalysisRepository.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningVariantAnalysisSkippedRepoGroup? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningVariantAnalysisSkippedRepoGroup.fromJson(json);
  }

  /// The total number of repositories that were skipped for this reason.
  /// Example: `2`
  final int repositoryCount;

  /// A list of repositories that were skipped. This list may not include all
  /// repositories that were skipped. This is only available when the
  /// repository was found and the user has access to it.
  final List<CodeScanningVariantAnalysisRepository> repositories;

  /// Converts a [CodeScanningVariantAnalysisSkippedRepoGroup]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'repository_count': repositoryCount,
      'repositories': repositories.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([repositoryCount, listHash(repositories)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningVariantAnalysisSkippedRepoGroup &&
        repositoryCount == other.repositoryCount &&
        listsEqual(repositories, other.repositories);
  }
}
