import 'package:meta/meta.dart';
import 'package:spacetraders/model/get_status200_response_leaderboards_most_credits_inner.dart';
import 'package:spacetraders/model/get_status200_response_leaderboards_most_submitted_charts_inner.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetStatus200ResponseLeaderboards {
  const GetStatus200ResponseLeaderboards({
    this.mostCredits = const [],
    this.mostSubmittedCharts = const [],
  });

  factory GetStatus200ResponseLeaderboards.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseLeaderboards(
      mostCredits:
          (json['mostCredits'] as List)
              .map<GetStatus200ResponseLeaderboardsMostCreditsInner>(
                (e) =>
                    GetStatus200ResponseLeaderboardsMostCreditsInner.fromJson(
                      e as Map<String, dynamic>,
                    ),
              )
              .toList(),
      mostSubmittedCharts:
          (json['mostSubmittedCharts'] as List)
              .map<GetStatus200ResponseLeaderboardsMostSubmittedChartsInner>(
                (e) =>
                    GetStatus200ResponseLeaderboardsMostSubmittedChartsInner.fromJson(
                      e as Map<String, dynamic>,
                    ),
              )
              .toList(),
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

  final List<GetStatus200ResponseLeaderboardsMostCreditsInner> mostCredits;
  final List<GetStatus200ResponseLeaderboardsMostSubmittedChartsInner>
  mostSubmittedCharts;

  Map<String, dynamic> toJson() {
    return {
      'mostCredits': mostCredits.map((e) => e.toJson()).toList(),
      'mostSubmittedCharts':
          mostSubmittedCharts.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hash(mostCredits, mostSubmittedCharts);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStatus200ResponseLeaderboards &&
        listsEqual(mostCredits, other.mostCredits) &&
        listsEqual(mostSubmittedCharts, other.mostSubmittedCharts);
  }
}
