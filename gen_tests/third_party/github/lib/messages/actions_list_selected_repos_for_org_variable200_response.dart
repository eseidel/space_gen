import 'package:github/model_helpers.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListSelectedReposForOrgVariable200Response {
  const ActionsListSelectedReposForOrgVariable200Response({
    required this.totalCount,
    required this.repositories,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListSelectedReposForOrgVariable200Response].
  factory ActionsListSelectedReposForOrgVariable200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListSelectedReposForOrgVariable200Response',
      json,
      () => ActionsListSelectedReposForOrgVariable200Response(
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
  static ActionsListSelectedReposForOrgVariable200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListSelectedReposForOrgVariable200Response.fromJson(json);
  }

  final int totalCount;
  final List<MinimalRepository> repositories;

  /// Converts an [ActionsListSelectedReposForOrgVariable200Response]
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
    return other is ActionsListSelectedReposForOrgVariable200Response &&
        totalCount == other.totalCount &&
        listsEqual(repositories, other.repositories);
  }
}
