import 'package:spacetraders/model/get_status200_response_leaderboards_most_credits_item.dart';
import 'package:spacetraders/model/get_status200_response_leaderboards_most_submitted_charts_item.dart';

class GetStatus200ResponseLeaderboards {
  GetStatus200ResponseLeaderboards({
    required this.mostCredits,
    required this.mostSubmittedCharts,
  });

  factory GetStatus200ResponseLeaderboards.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseLeaderboards(
      mostCredits:
          (json['mostCredits'] as List<dynamic>)
              .map<GetStatus200ResponseLeaderboardsMostCreditsItem>(
                (e) => GetStatus200ResponseLeaderboardsMostCreditsItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      mostSubmittedCharts:
          (json['mostSubmittedCharts'] as List<dynamic>)
              .map<GetStatus200ResponseLeaderboardsMostSubmittedChartsItem>(
                (e) =>
                    GetStatus200ResponseLeaderboardsMostSubmittedChartsItem.fromJson(
                      e as Map<String, dynamic>,
                    ),
              )
              .toList(),
    );
  }

  final List<GetStatus200ResponseLeaderboardsMostCreditsItem> mostCredits;
  final List<GetStatus200ResponseLeaderboardsMostSubmittedChartsItem>
  mostSubmittedCharts;

  Map<String, dynamic> toJson() {
    return {
      'mostCredits': mostCredits.map((e) => e.toJson()).toList(),
      'mostSubmittedCharts':
          mostSubmittedCharts.map((e) => e.toJson()).toList(),
    };
  }
}
