import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetStatus200ResponseLeaderboardsMostCreditsInner {
  const GetStatus200ResponseLeaderboardsMostCreditsInner({
    required this.agentSymbol,
    required this.credits,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [GetStatus200ResponseLeaderboardsMostCreditsInner].
  factory GetStatus200ResponseLeaderboardsMostCreditsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'GetStatus200ResponseLeaderboardsMostCreditsInner',
      json,
      () => GetStatus200ResponseLeaderboardsMostCreditsInner(
        agentSymbol: json['agentSymbol'] as String,
        credits: json['credits'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseLeaderboardsMostCreditsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseLeaderboardsMostCreditsInner.fromJson(json);
  }

  /// Symbol of the agent.
  final String agentSymbol;

  /// Amount of credits.
  final int credits;

  /// Converts a [GetStatus200ResponseLeaderboardsMostCreditsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'agentSymbol': agentSymbol, 'credits': credits};
  }

  @override
  int get hashCode => Object.hashAll([agentSymbol, credits]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStatus200ResponseLeaderboardsMostCreditsInner &&
        agentSymbol == other.agentSymbol &&
        credits == other.credits;
  }
}
