class GetStatus200ResponseLeaderboards {
  GetStatus200ResponseLeaderboards({
    required this.mostCredits,
    required this.mostSubmittedCharts,
  });

  factory GetStatus200ResponseLeaderboards.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseLeaderboards(
      mostCredits:
          (json['mostCredits'] as List<dynamic>)
              .map<GetStatus200ResponseLeaderboardsMostCredits>(
                (e) => GetStatus200ResponseLeaderboardsMostCredits.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      mostSubmittedCharts:
          (json['mostSubmittedCharts'] as List<dynamic>)
              .map<GetStatus200ResponseLeaderboardsMostSubmittedCharts>(
                (e) =>
                    GetStatus200ResponseLeaderboardsMostSubmittedCharts.fromJson(
                      e as Map<String, dynamic>,
                    ),
              )
              .toList(),
    );
  }

  final List<GetStatus200ResponseLeaderboardsMostCredits> mostCredits;
  final List<GetStatus200ResponseLeaderboardsMostSubmittedCharts>
  mostSubmittedCharts;

  Map<String, dynamic> toJson() {
    return {
      'mostCredits': mostCredits.map((e) => e.toJson()).toList(),
      'mostSubmittedCharts':
          mostSubmittedCharts.map((e) => e.toJson()).toList(),
    };
  }
}

class GetStatus200ResponseLeaderboardsMostCredits {
  GetStatus200ResponseLeaderboardsMostCredits({
    required this.agentSymbol,
    required this.credits,
  });

  factory GetStatus200ResponseLeaderboardsMostCredits.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseLeaderboardsMostCredits(
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

class GetStatus200ResponseLeaderboardsMostSubmittedCharts {
  GetStatus200ResponseLeaderboardsMostSubmittedCharts({
    required this.agentSymbol,
    required this.chartCount,
  });

  factory GetStatus200ResponseLeaderboardsMostSubmittedCharts.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetStatus200ResponseLeaderboardsMostSubmittedCharts(
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
