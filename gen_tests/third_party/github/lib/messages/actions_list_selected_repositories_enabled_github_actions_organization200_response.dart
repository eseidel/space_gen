// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repository.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response {
  const ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response({
    required this.totalCount,
    required this.repositories,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response].
  factory ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response',
      json,
      () =>
          ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response(
            totalCount: (json['total_count'] as num).toDouble(),
            repositories: (json['repositories'] as List)
                .map<Repository>(
                  (e) => Repository.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response.fromJson(
      json,
    );
  }

  final double totalCount;
  final List<Repository> repositories;

  /// Converts an [ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'repositories': repositories.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(repositories)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response &&
        totalCount == other.totalCount &&
        listsEqual(repositories, other.repositories);
  }
}
