import 'package:github/model_helpers.dart';
import 'package:github/models/actions_hosted_runner.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListHostedRunnersForOrg200Response {
  const ActionsListHostedRunnersForOrg200Response({
    required this.totalCount,
    required this.runners,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListHostedRunnersForOrg200Response].
  factory ActionsListHostedRunnersForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListHostedRunnersForOrg200Response',
      json,
      () => ActionsListHostedRunnersForOrg200Response(
        totalCount: json['total_count'] as int,
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
  static ActionsListHostedRunnersForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListHostedRunnersForOrg200Response.fromJson(json);
  }

  final int totalCount;
  final List<ActionsHostedRunner> runners;

  /// Converts an [ActionsListHostedRunnersForOrg200Response]
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
    return other is ActionsListHostedRunnersForOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(runners, other.runners);
  }
}
