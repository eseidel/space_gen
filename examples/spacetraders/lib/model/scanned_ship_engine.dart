class ScannedShipEngine {
  ScannedShipEngine({required this.symbol});

  factory ScannedShipEngine.fromJson(Map<String, dynamic> json) {
    return ScannedShipEngine(symbol: json['symbol'] as String);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
