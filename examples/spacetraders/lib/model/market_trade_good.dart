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
      supply: MarketTradeGoodSupplyString.fromJson(json['supply'] as String),
      purchasePrice: json['purchasePrice'] as int,
      sellPrice: json['sellPrice'] as int,
    );
  }

  final String symbol;
  final int tradeVolume;
  final MarketTradeGoodSupplyString supply;
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

enum MarketTradeGoodSupplyString {
  scarce('SCARCE'),
  limited('LIMITED'),
  moderate('MODERATE'),
  abundant('ABUNDANT'),
  ;

  const MarketTradeGoodSupplyString(this.value);

  factory MarketTradeGoodSupplyString.fromJson(String json) {
    switch (json) {
      case 'SCARCE':
        return MarketTradeGoodSupplyString.scarce;
      case 'LIMITED':
        return MarketTradeGoodSupplyString.limited;
      case 'MODERATE':
        return MarketTradeGoodSupplyString.moderate;
      case 'ABUNDANT':
        return MarketTradeGoodSupplyString.abundant;
      default:
        throw Exception('Unknown MarketTradeGoodSupplyString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case MarketTradeGoodSupplyString.scarce:
        return 'SCARCE';
      case MarketTradeGoodSupplyString.limited:
        return 'LIMITED';
      case MarketTradeGoodSupplyString.moderate:
        return 'MODERATE';
      case MarketTradeGoodSupplyString.abundant:
        return 'ABUNDANT';
    }
  }
}
