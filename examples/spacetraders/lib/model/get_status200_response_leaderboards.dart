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

class GetStatus200ResponseLeaderboardsMostCreditsItem {
  GetStatus200ResponseLeaderboardsMostCreditsItem({
    required this.agentSymbol,
    required this.credits,
  });

  factory GetStatus200ResponseLeaderboardsMostCreditsItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseLeaderboardsMostCreditsItem(
      agentSymbol: json['agentSymbol'] as String,
      credits: json['credits'] as int,
    );
  }

  final String agentSymbol;
  final int credits;

  Map<String, dynamic> toJson() {
    return {'agentSymbol': agentSymbol, 'credits': credits};
  }
}

class GetStatus200ResponseLeaderboardsMostSubmittedChartsItem {
  GetStatus200ResponseLeaderboardsMostSubmittedChartsItem({
    required this.agentSymbol,
    required this.chartCount,
  });

  factory GetStatus200ResponseLeaderboardsMostSubmittedChartsItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseLeaderboardsMostSubmittedChartsItem(
      agentSymbol: json['agentSymbol'] as String,
      chartCount: json['chartCount'] as int,
    );
  }

  final String agentSymbol;
  final int chartCount;

  Map<String, dynamic> toJson() {
    return {'agentSymbol': agentSymbol, 'chartCount': chartCount};
  }
}
