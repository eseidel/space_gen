import 'package:github/model_helpers.dart';
import 'package:github/models/runner_groups_org.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListSelfHostedRunnerGroupsForOrg200Response {
  const ActionsListSelfHostedRunnerGroupsForOrg200Response({
    required this.totalCount,
    required this.runnerGroups,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListSelfHostedRunnerGroupsForOrg200Response].
  factory ActionsListSelfHostedRunnerGroupsForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListSelfHostedRunnerGroupsForOrg200Response',
      json,
      () => ActionsListSelfHostedRunnerGroupsForOrg200Response(
        totalCount: (json['total_count'] as num).toDouble(),
        runnerGroups: (json['runner_groups'] as List)
            .map<RunnerGroupsOrg>(
              (e) => RunnerGroupsOrg.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListSelfHostedRunnerGroupsForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListSelfHostedRunnerGroupsForOrg200Response.fromJson(json);
  }

  final double totalCount;
  final List<RunnerGroupsOrg> runnerGroups;

  /// Converts an [ActionsListSelfHostedRunnerGroupsForOrg200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'runner_groups': runnerGroups.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(runnerGroups)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsListSelfHostedRunnerGroupsForOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(runnerGroups, other.runnerGroups);
  }
}
