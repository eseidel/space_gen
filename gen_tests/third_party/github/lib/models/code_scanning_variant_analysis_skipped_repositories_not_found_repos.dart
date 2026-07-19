import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos {
  const CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos({
    required this.repositoryCount,
    required this.repositoryFullNames,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos].
  factory CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos',
      json,
      () => CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos(
        repositoryCount: json['repository_count'] as int,
        repositoryFullNames: (json['repository_full_names'] as List)
            .cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos.fromJson(
      json,
    );
  }

  /// The total number of repositories that were skipped for this reason.
  /// Example: `2`
  final int repositoryCount;

  /// A list of full repository names that were skipped. This list may not
  /// include all repositories that were skipped.
  final List<String> repositoryFullNames;

  /// Converts a [CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'repository_count': repositoryCount,
      'repository_full_names': repositoryFullNames,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([repositoryCount, listHash(repositoryFullNames)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos &&
        repositoryCount == other.repositoryCount &&
        listsEqual(repositoryFullNames, other.repositoryFullNames);
  }
}
