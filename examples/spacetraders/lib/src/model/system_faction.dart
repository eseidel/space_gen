
class SystemFaction {
  SystemFaction({
    required this.symbol,
  });

  factory SystemFaction.fromJson(Map<String, dynamic> json) {
    return SystemFaction(
      symbol: json['symbol'] as String,
    );
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
    };
  }
}
