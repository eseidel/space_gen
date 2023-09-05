class Agent {
  Agent({
    required this.accountId,
    required this.symbol,
    required this.headquarters,
    required this.credits,
    required this.startingFaction,
    required this.shipCount,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      accountId: json['accountId'] as String,
      symbol: json['symbol'] as String,
      headquarters: json['headquarters'] as String,
      credits: json['credits'] as int,
      startingFaction: json['startingFaction'] as String,
      shipCount: json['shipCount'] as int,
    );
  }

  final String accountId;
  final String symbol;
  final String headquarters;
  final int credits;
  final String startingFaction;
  final int shipCount;

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'symbol': symbol,
      'headquarters': headquarters,
      'credits': credits,
      'startingFaction': startingFaction,
      'shipCount': shipCount,
    };
  }
}
