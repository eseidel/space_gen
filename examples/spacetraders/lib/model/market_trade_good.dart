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
      supply: MarketTradeGoodSupplyInner.fromJson(json['supply'] as String),
      purchasePrice: json['purchasePrice'] as int,
      sellPrice: json['sellPrice'] as int,
    );
  }

  final String symbol;
  final int tradeVolume;
  final MarketTradeGoodSupplyInner supply;
  final int purchasePrice;
  final int sellPrice;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'tradeVolume': tradeVolume,
      'supply': supply.toJson(),
      'purchasePrice': purchasePrice,
      'sellPrice': sellPrice,
    };
  }
}

enum MarketTradeGoodSupplyInner {
  scarce('SCARCE'),
  limited('LIMITED'),
  moderate('MODERATE'),
  abundant('ABUNDANT'),
  ;

  const MarketTradeGoodSupplyInner(this.value);

  factory MarketTradeGoodSupplyInner.fromJson(String json) {
    return MarketTradeGoodSupplyInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw Exception('Unknown MarketTradeGoodSupplyInner value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
