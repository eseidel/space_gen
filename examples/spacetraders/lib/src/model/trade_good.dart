class TradeGood {
  TradeGood({
    required this.symbol,
    required this.name,
    required this.description,
  });

  factory TradeGood.fromJson(Map<String, dynamic> json) {
    return TradeGood(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  final String symbol;
  final String name;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'description': description,
    };
  }
}
