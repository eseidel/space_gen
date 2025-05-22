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
