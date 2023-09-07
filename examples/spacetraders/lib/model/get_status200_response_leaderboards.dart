class GetStatus200ResponseLeaderboards {
  GetStatus200ResponseLeaderboards({
    required this.mostCredits,
    required this.mostSubmittedCharts,
  });

  factory GetStatus200ResponseLeaderboards.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseLeaderboards(
      mostCredits: (json['mostCredits'] as List<dynamic>)
          .map<GetStatus200ResponseLeaderboardsMostCreditsArray>(
            (e) => GetStatus200ResponseLeaderboardsMostCreditsArray.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      mostSubmittedCharts: (json['mostSubmittedCharts'] as List<dynamic>)
          .map<GetStatus200ResponseLeaderboardsMostSubmittedChartsArray>(
            (e) => GetStatus200ResponseLeaderboardsMostSubmittedChartsArray
                .fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  final List<GetStatus200ResponseLeaderboardsMostCreditsArray> mostCredits;
  final List<GetStatus200ResponseLeaderboardsMostSubmittedChartsArray>
      mostSubmittedCharts;

  Map<String, dynamic> toJson() {
    return {
      'mostCredits': mostCredits.map((e) => e.toJson()).toList(),
      'mostSubmittedCharts':
          mostSubmittedCharts.map((e) => e.toJson()).toList(),
    };
  }
}

class GetStatus200ResponseLeaderboardsMostCreditsArray {
  GetStatus200ResponseLeaderboardsMostCreditsArray({
    required this.agentSymbol,
    required this.credits,
  });

  factory GetStatus200ResponseLeaderboardsMostCreditsArray.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseLeaderboardsMostCreditsArray(
      agentSymbol: json['agentSymbol'] as String,
      credits: json['credits'] as int,
    );
  }

  final String agentSymbol;
  final int credits;

  Map<String, dynamic> toJson() {
    return {
      'agentSymbol': agentSymbol,
      'credits': credits,
    };
  }
}

class GetStatus200ResponseLeaderboardsMostSubmittedChartsArray {
  GetStatus200ResponseLeaderboardsMostSubmittedChartsArray({
    required this.agentSymbol,
    required this.chartCount,
  });

  factory GetStatus200ResponseLeaderboardsMostSubmittedChartsArray.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseLeaderboardsMostSubmittedChartsArray(
      agentSymbol: json['agentSymbol'] as String,
      chartCount: json['chartCount'] as int,
    );
  }

  final String agentSymbol;
  final int chartCount;

  Map<String, dynamic> toJson() {
    return {
      'agentSymbol': agentSymbol,
      'chartCount': chartCount,
    };
  }
}
