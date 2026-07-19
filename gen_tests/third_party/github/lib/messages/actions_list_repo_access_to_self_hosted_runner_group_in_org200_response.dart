// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response {
  const ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response({
    required this.totalCount,
    required this.repositories,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response].
  factory ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response',
      json,
      () => ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response(
        totalCount: (json['total_count'] as num).toDouble(),
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
  static ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response.fromJson(
      json,
    );
  }

  final double totalCount;
  final List<MinimalRepository> repositories;

  /// Converts an [ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response]
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
            is ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(repositories, other.repositories);
  }
}
