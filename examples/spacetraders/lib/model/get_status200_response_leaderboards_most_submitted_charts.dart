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
