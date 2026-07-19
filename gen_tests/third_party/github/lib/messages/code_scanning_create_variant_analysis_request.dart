import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_variant_analysis_language.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningCreateVariantAnalysisRequest {
  const CodeScanningCreateVariantAnalysisRequest({
    required this.language,
    required this.queryPack,
    this.repositories,
    this.repositoryLists,
    this.repositoryOwners,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeScanningCreateVariantAnalysisRequest].
  factory CodeScanningCreateVariantAnalysisRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeScanningCreateVariantAnalysisRequest',
      json,
      () => CodeScanningCreateVariantAnalysisRequest(
        language: CodeScanningVariantAnalysisLanguage.fromJson(
          json['language'] as String,
        ),
        queryPack: json['query_pack'] as String,
        repositories: (json['repositories'] as List?)?.cast<String>(),
        repositoryLists: (json['repository_lists'] as List?)?.cast<String>(),
        repositoryOwners: (json['repository_owners'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningCreateVariantAnalysisRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningCreateVariantAnalysisRequest.fromJson(json);
  }

  /// The language targeted by the CodeQL query
  final CodeScanningVariantAnalysisLanguage language;

  /// A Base64-encoded tarball containing a CodeQL query and all its
  /// dependencies
  final String queryPack;

  /// List of repository names (in the form `owner/repo-name`) to run the
  /// query against. Precisely one property from `repositories`,
  /// `repository_lists` and `repository_owners` is required.
  final List<String>? repositories;

  /// List of repository lists to run the query against. Precisely one
  /// property from `repositories`, `repository_lists` and `repository_owners`
  /// is required.
  final List<String>? repositoryLists;

  /// List of organization or user names whose repositories the query should
  /// be run against. Precisely one property from `repositories`,
  /// `repository_lists` and `repository_owners` is required.
  final List<String>? repositoryOwners;

  /// Converts a [CodeScanningCreateVariantAnalysisRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'language': language.toJson(),
      'query_pack': queryPack,
      'repositories': ?repositories,
      'repository_lists': ?repositoryLists,
      'repository_owners': ?repositoryOwners,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    language,
    queryPack,
    listHash(repositories),
    listHash(repositoryLists),
    listHash(repositoryOwners),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningCreateVariantAnalysisRequest &&
        language == other.language &&
        queryPack == other.queryPack &&
        listsEqual(repositories, other.repositories) &&
        listsEqual(repositoryLists, other.repositoryLists) &&
        listsEqual(repositoryOwners, other.repositoryOwners);
  }
}
