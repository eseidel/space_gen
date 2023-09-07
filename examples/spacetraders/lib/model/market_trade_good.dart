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
    switch (json) {
      case 'SCARCE':
        return MarketTradeGoodSupplyInner.scarce;
      case 'LIMITED':
        return MarketTradeGoodSupplyInner.limited;
      case 'MODERATE':
        return MarketTradeGoodSupplyInner.moderate;
      case 'ABUNDANT':
        return MarketTradeGoodSupplyInner.abundant;
      default:
        throw Exception('Unknown MarketTradeGoodSupplyInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case MarketTradeGoodSupplyInner.scarce:
        return 'SCARCE';
      case MarketTradeGoodSupplyInner.limited:
        return 'LIMITED';
      case MarketTradeGoodSupplyInner.moderate:
        return 'MODERATE';
      case MarketTradeGoodSupplyInner.abundant:
        return 'ABUNDANT';
    }
  }
}
