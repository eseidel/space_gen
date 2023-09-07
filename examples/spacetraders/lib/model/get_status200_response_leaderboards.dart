class GetStatus200ResponseLeaderboards {
  GetStatus200ResponseLeaderboards({
    required this.mostCredits,
    required this.mostSubmittedCharts,
  });

  factory GetStatus200ResponseLeaderboards.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseLeaderboards(
      mostCredits: (json['mostCredits'] as List<dynamic>)
          .map<GetStatus200ResponseLeaderboardsMostCreditsInner>(
            (e) => GetStatus200ResponseLeaderboardsMostCreditsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      mostSubmittedCharts: (json['mostSubmittedCharts'] as List<dynamic>)
          .map<GetStatus200ResponseLeaderboardsMostSubmittedChartsInner>(
            (e) => GetStatus200ResponseLeaderboardsMostSubmittedChartsInner
                .fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
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
}

class GetStatus200ResponseLeaderboardsMostCreditsInner {
  GetStatus200ResponseLeaderboardsMostCreditsInner({
    required this.agentSymbol,
    required this.credits,
  });

  factory GetStatus200ResponseLeaderboardsMostCreditsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseLeaderboardsMostCreditsInner(
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

class GetStatus200ResponseLeaderboardsMostSubmittedChartsInner {
  GetStatus200ResponseLeaderboardsMostSubmittedChartsInner({
    required this.agentSymbol,
    required this.chartCount,
  });

  factory GetStatus200ResponseLeaderboardsMostSubmittedChartsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseLeaderboardsMostSubmittedChartsInner(
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
