import 'package:github/model_helpers.dart';
import 'package:github/models/runner.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListSelfHostedRunnersForOrg200Response {
  const ActionsListSelfHostedRunnersForOrg200Response({
    required this.totalCount,
    required this.runners,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListSelfHostedRunnersForOrg200Response].
  factory ActionsListSelfHostedRunnersForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListSelfHostedRunnersForOrg200Response',
      json,
      () => ActionsListSelfHostedRunnersForOrg200Response(
        totalCount: json['total_count'] as int,
        runners: (json['runners'] as List)
            .map<Runner>((e) => Runner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListSelfHostedRunnersForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListSelfHostedRunnersForOrg200Response.fromJson(json);
  }

  final int totalCount;
  final List<Runner> runners;

  /// Converts an [ActionsListSelfHostedRunnersForOrg200Response]
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
    return other is ActionsListSelfHostedRunnersForOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(runners, other.runners);
  }
}
