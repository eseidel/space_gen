import 'package:github/model_helpers.dart';
import 'package:github/models/actions_cache_usage_by_repository.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsGetActionsCacheUsageByRepoForOrg200Response {
  const ActionsGetActionsCacheUsageByRepoForOrg200Response({
    required this.totalCount,
    required this.repositoryCacheUsages,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsGetActionsCacheUsageByRepoForOrg200Response].
  factory ActionsGetActionsCacheUsageByRepoForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsGetActionsCacheUsageByRepoForOrg200Response',
      json,
      () => ActionsGetActionsCacheUsageByRepoForOrg200Response(
        totalCount: json['total_count'] as int,
        repositoryCacheUsages: (json['repository_cache_usages'] as List)
            .map<ActionsCacheUsageByRepository>(
              (e) => ActionsCacheUsageByRepository.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsGetActionsCacheUsageByRepoForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsGetActionsCacheUsageByRepoForOrg200Response.fromJson(json);
  }

  final int totalCount;
  final List<ActionsCacheUsageByRepository> repositoryCacheUsages;

  /// Converts an [ActionsGetActionsCacheUsageByRepoForOrg200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'repository_cache_usages': repositoryCacheUsages
          .map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([totalCount, listHash(repositoryCacheUsages)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsGetActionsCacheUsageByRepoForOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(repositoryCacheUsages, other.repositoryCacheUsages);
  }
}
