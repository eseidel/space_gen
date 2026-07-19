import 'package:github/model_helpers.dart';
import 'package:github/models/actions_hosted_runner.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListGithubHostedRunnersInGroupForOrg200Response {
  const ActionsListGithubHostedRunnersInGroupForOrg200Response({
    required this.totalCount,
    required this.runners,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListGithubHostedRunnersInGroupForOrg200Response].
  factory ActionsListGithubHostedRunnersInGroupForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListGithubHostedRunnersInGroupForOrg200Response',
      json,
      () => ActionsListGithubHostedRunnersInGroupForOrg200Response(
        totalCount: (json['total_count'] as num).toDouble(),
        runners: (json['runners'] as List)
            .map<ActionsHostedRunner>(
              (e) => ActionsHostedRunner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListGithubHostedRunnersInGroupForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListGithubHostedRunnersInGroupForOrg200Response.fromJson(
      json,
    );
  }

  final double totalCount;
  final List<ActionsHostedRunner> runners;

  /// Converts an [ActionsListGithubHostedRunnersInGroupForOrg200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'runners': runners.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(runners)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsListGithubHostedRunnersInGroupForOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(runners, other.runners);
  }
}
