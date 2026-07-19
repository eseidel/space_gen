// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/get_status200_response_leaderboards_most_credits_inner.dart';
import 'package:spacetraders/models/get_status200_response_leaderboards_most_submitted_charts_inner.dart';

@immutable
class GetStatus200ResponseLeaderboards {
  const GetStatus200ResponseLeaderboards({
    required this.mostCredits,
    required this.mostSubmittedCharts,
  });

  /// Converts a `Map<String, dynamic>` to a [GetStatus200ResponseLeaderboards].
  factory GetStatus200ResponseLeaderboards.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetStatus200ResponseLeaderboards',
      json,
      () => GetStatus200ResponseLeaderboards(
        mostCredits: (json['mostCredits'] as List)
            .map<GetStatus200ResponseLeaderboardsMostCreditsInner>(
              (e) => GetStatus200ResponseLeaderboardsMostCreditsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        mostSubmittedCharts: (json['mostSubmittedCharts'] as List)
            .map<GetStatus200ResponseLeaderboardsMostSubmittedChartsInner>(
              (e) =>
                  GetStatus200ResponseLeaderboardsMostSubmittedChartsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseLeaderboards? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseLeaderboards.fromJson(json);
  }

  /// Top agents with the most credits.
  final List<GetStatus200ResponseLeaderboardsMostCreditsInner> mostCredits;

  /// Top agents with the most charted submitted.
  final List<GetStatus200ResponseLeaderboardsMostSubmittedChartsInner>
  mostSubmittedCharts;

  /// Converts a [GetStatus200ResponseLeaderboards] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'mostCredits': mostCredits.map((e) => e.toJson()).toList(),
      'mostSubmittedCharts': mostSubmittedCharts
          .map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(mostCredits), listHash(mostSubmittedCharts)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStatus200ResponseLeaderboards &&
        listsEqual(mostCredits, other.mostCredits) &&
        listsEqual(mostSubmittedCharts, other.mostSubmittedCharts);
  }
}
