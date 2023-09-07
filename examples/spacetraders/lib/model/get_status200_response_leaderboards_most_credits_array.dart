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
