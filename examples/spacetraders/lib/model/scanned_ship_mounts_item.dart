class ScannedShipMountsItem {
  ScannedShipMountsItem({required this.symbol});

  factory ScannedShipMountsItem.fromJson(Map<String, dynamic> json) {
    return ScannedShipMountsItem(symbol: json['symbol'] as String);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
