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
