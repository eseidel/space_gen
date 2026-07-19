import 'package:github/model_helpers.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:meta/meta.dart';

@immutable
class DependabotListSelectedReposForOrgSecret200Response {
  const DependabotListSelectedReposForOrgSecret200Response({
    required this.totalCount,
    required this.repositories,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotListSelectedReposForOrgSecret200Response].
  factory DependabotListSelectedReposForOrgSecret200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotListSelectedReposForOrgSecret200Response',
      json,
      () => DependabotListSelectedReposForOrgSecret200Response(
        totalCount: json['total_count'] as int,
        repositories: (json['repositories'] as List)
            .map<MinimalRepository>(
              (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotListSelectedReposForOrgSecret200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotListSelectedReposForOrgSecret200Response.fromJson(json);
  }

  final int totalCount;
  final List<MinimalRepository> repositories;

  /// Converts a [DependabotListSelectedReposForOrgSecret200Response]
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
    return other is DependabotListSelectedReposForOrgSecret200Response &&
        totalCount == other.totalCount &&
        listsEqual(repositories, other.repositories);
  }
}
