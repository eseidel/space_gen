import 'package:github/model_helpers.dart';
import 'package:github/models/runner.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListSelfHostedRunnersForRepo200Response {
  const ActionsListSelfHostedRunnersForRepo200Response({
    required this.totalCount,
    required this.runners,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListSelfHostedRunnersForRepo200Response].
  factory ActionsListSelfHostedRunnersForRepo200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListSelfHostedRunnersForRepo200Response',
      json,
      () => ActionsListSelfHostedRunnersForRepo200Response(
        totalCount: json['total_count'] as int,
        runners: (json['runners'] as List)
            .map<Runner>((e) => Runner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListSelfHostedRunnersForRepo200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListSelfHostedRunnersForRepo200Response.fromJson(json);
  }

  final int totalCount;
  final List<Runner> runners;

  /// Converts an [ActionsListSelfHostedRunnersForRepo200Response]
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
    return other is ActionsListSelfHostedRunnersForRepo200Response &&
        totalCount == other.totalCount &&
        listsEqual(runners, other.runners);
  }
}
