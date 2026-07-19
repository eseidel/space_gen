import 'package:github/model_helpers.dart';
import 'package:github/models/repository.dart';
import 'package:meta/meta.dart';

@immutable
class AppsListReposAccessibleToInstallation200Response {
  const AppsListReposAccessibleToInstallation200Response({
    required this.totalCount,
    required this.repositories,
    this.repositorySelection,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [AppsListReposAccessibleToInstallation200Response].
  factory AppsListReposAccessibleToInstallation200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'AppsListReposAccessibleToInstallation200Response',
      json,
      () => AppsListReposAccessibleToInstallation200Response(
        totalCount: json['total_count'] as int,
        repositories: (json['repositories'] as List)
            .map<Repository>(
              (e) => Repository.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        repositorySelection: json['repository_selection'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AppsListReposAccessibleToInstallation200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return AppsListReposAccessibleToInstallation200Response.fromJson(json);
  }

  final int totalCount;
  final List<Repository> repositories;

  /// Example: `'selected'`
  final String? repositorySelection;

  /// Converts an [AppsListReposAccessibleToInstallation200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'repositories': repositories.map((e) => e.toJson()).toList(),
      'repository_selection': repositorySelection,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([totalCount, listHash(repositories), repositorySelection]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppsListReposAccessibleToInstallation200Response &&
        totalCount == other.totalCount &&
        listsEqual(repositories, other.repositories) &&
        repositorySelection == other.repositorySelection;
  }
}
