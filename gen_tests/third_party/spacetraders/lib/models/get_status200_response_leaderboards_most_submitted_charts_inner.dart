import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetStatus200ResponseLeaderboardsMostSubmittedChartsInner {
  const GetStatus200ResponseLeaderboardsMostSubmittedChartsInner({
    required this.agentSymbol,
    required this.chartCount,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [GetStatus200ResponseLeaderboardsMostSubmittedChartsInner].
  factory GetStatus200ResponseLeaderboardsMostSubmittedChartsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'GetStatus200ResponseLeaderboardsMostSubmittedChartsInner',
      json,
      () => GetStatus200ResponseLeaderboardsMostSubmittedChartsInner(
        agentSymbol: json['agentSymbol'] as String,
        chartCount: json['chartCount'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseLeaderboardsMostSubmittedChartsInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseLeaderboardsMostSubmittedChartsInner.fromJson(
      json,
    );
  }

  /// Symbol of the agent.
  final String agentSymbol;

  /// Amount of charts done by the agent.
  final int chartCount;

  /// Converts a [GetStatus200ResponseLeaderboardsMostSubmittedChartsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'agentSymbol': agentSymbol, 'chartCount': chartCount};
  }

  @override
  int get hashCode => Object.hashAll([agentSymbol, chartCount]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStatus200ResponseLeaderboardsMostSubmittedChartsInner &&
        agentSymbol == other.agentSymbol &&
        chartCount == other.chartCount;
  }
}
