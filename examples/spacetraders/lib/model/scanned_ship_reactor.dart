class ScannedShipReactor {
  ScannedShipReactor({required this.symbol});

  factory ScannedShipReactor.fromJson(Map<String, dynamic> json) {
    return ScannedShipReactor(symbol: json['symbol'] as String);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
