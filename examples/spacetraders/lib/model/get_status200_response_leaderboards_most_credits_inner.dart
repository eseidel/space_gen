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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseLeaderboardsMostCreditsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseLeaderboardsMostCreditsInner.fromJson(json);
  }

  final String agentSymbol;
  final int credits;

  Map<String, dynamic> toJson() {
    return {'agentSymbol': agentSymbol, 'credits': credits};
  }
}
