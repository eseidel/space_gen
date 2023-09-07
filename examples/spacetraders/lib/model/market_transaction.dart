class MarketTransaction {
  MarketTransaction({
    required this.waypointSymbol,
    required this.shipSymbol,
    required this.tradeSymbol,
    required this.type,
    required this.units,
    required this.pricePerUnit,
    required this.totalPrice,
    required this.timestamp,
  });

  factory MarketTransaction.fromJson(Map<String, dynamic> json) {
    return MarketTransaction(
      waypointSymbol: json['waypointSymbol'] as String,
      shipSymbol: json['shipSymbol'] as String,
      tradeSymbol: json['tradeSymbol'] as String,
      type: MarketTransactionTypeInner.fromJson(json['type'] as String),
      units: json['units'] as int,
      pricePerUnit: json['pricePerUnit'] as int,
      totalPrice: json['totalPrice'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  final String waypointSymbol;
  final String shipSymbol;
  final String tradeSymbol;
  final MarketTransactionTypeInner type;
  final int units;
  final int pricePerUnit;
  final int totalPrice;
  final DateTime timestamp;

  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol,
      'shipSymbol': shipSymbol,
      'tradeSymbol': tradeSymbol,
      'type': type.toJson(),
      'units': units,
      'pricePerUnit': pricePerUnit,
      'totalPrice': totalPrice,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

enum MarketTransactionTypeInner {
  purchase('PURCHASE'),
  sell('SELL'),
  ;

  const MarketTransactionTypeInner(this.value);

  factory MarketTransactionTypeInner.fromJson(String json) {
    return MarketTransactionTypeInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw Exception('Unknown MarketTransactionTypeInner value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
