class PublicAgent {
  PublicAgent({
    required this.symbol,
    required this.headquarters,
    required this.credits,
    required this.startingFaction,
    required this.shipCount,
  });

  factory PublicAgent.fromJson(Map<String, dynamic> json) {
    return PublicAgent(
      symbol: json['symbol'] as String,
      headquarters: json['headquarters'] as String,
      credits: json['credits'] as int,
      startingFaction: json['startingFaction'] as String,
      shipCount: json['shipCount'] as int,
    );
  }

  final String symbol;
  final String headquarters;
  final int credits;
  final String startingFaction;
  final int shipCount;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'headquarters': headquarters,
      'credits': credits,
      'startingFaction': startingFaction,
      'shipCount': shipCount,
    };
  }
}
