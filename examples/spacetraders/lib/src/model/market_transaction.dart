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
      type: json['type'] as String,
      units: json['units'] as int,
      pricePerUnit: json['pricePerUnit'] as int,
      totalPrice: json['totalPrice'] as int,
      timestamp: json['timestamp'] as String,
    );
  }

  final String waypointSymbol;
  final String shipSymbol;
  final String tradeSymbol;
  final String type;
  final int units;
  final int pricePerUnit;
  final int totalPrice;
  final String timestamp;

  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol,
      'shipSymbol': shipSymbol,
      'tradeSymbol': tradeSymbol,
      'type': type,
      'units': units,
      'pricePerUnit': pricePerUnit,
      'totalPrice': totalPrice,
      'timestamp': timestamp,
    };
  }
}
