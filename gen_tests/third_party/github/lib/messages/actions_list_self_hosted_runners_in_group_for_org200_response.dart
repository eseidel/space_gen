import 'package:github/model_helpers.dart';
import 'package:github/models/runner.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListSelfHostedRunnersInGroupForOrg200Response {
  const ActionsListSelfHostedRunnersInGroupForOrg200Response({
    required this.totalCount,
    required this.runners,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListSelfHostedRunnersInGroupForOrg200Response].
  factory ActionsListSelfHostedRunnersInGroupForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListSelfHostedRunnersInGroupForOrg200Response',
      json,
      () => ActionsListSelfHostedRunnersInGroupForOrg200Response(
        totalCount: (json['total_count'] as num).toDouble(),
        runners: (json['runners'] as List)
            .map<Runner>((e) => Runner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListSelfHostedRunnersInGroupForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListSelfHostedRunnersInGroupForOrg200Response.fromJson(json);
  }

  final double totalCount;
  final List<Runner> runners;

  /// Converts an [ActionsListSelfHostedRunnersInGroupForOrg200Response]
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
    return other is ActionsListSelfHostedRunnersInGroupForOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(runners, other.runners);
  }
}
