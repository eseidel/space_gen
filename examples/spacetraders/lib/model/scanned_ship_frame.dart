class ScannedShipFrame {
  ScannedShipFrame({required this.symbol});

  factory ScannedShipFrame.fromJson(Map<String, dynamic> json) {
    return ScannedShipFrame(symbol: json['symbol'] as String);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }
}
