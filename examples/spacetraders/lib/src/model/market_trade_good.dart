class MarketTradeGood {
  MarketTradeGood({
    required this.symbol,
    required this.tradeVolume,
    required this.supply,
    required this.purchasePrice,
    required this.sellPrice,
  });

  factory MarketTradeGood.fromJson(Map<String, dynamic> json) {
    return MarketTradeGood(
      symbol: json['symbol'] as String,
      tradeVolume: json['tradeVolume'] as int,
      supply: json['supply'] as String,
      purchasePrice: json['purchasePrice'] as int,
      sellPrice: json['sellPrice'] as int,
    );
  }

  final String symbol;
  final int tradeVolume;
  final String supply;
  final int purchasePrice;
  final int sellPrice;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'tradeVolume': tradeVolume,
      'supply': supply,
      'purchasePrice': purchasePrice,
      'sellPrice': sellPrice,
    };
  }
}
