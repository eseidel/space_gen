class ScrapTransaction {
  ScrapTransaction({
    required this.waypointSymbol,
    required this.shipSymbol,
    required this.totalPrice,
    required this.timestamp,
  });

  factory ScrapTransaction.fromJson(Map<String, dynamic> json) {
    return ScrapTransaction(
      waypointSymbol: json['waypointSymbol'] as String,
      shipSymbol: json['shipSymbol'] as String,
      totalPrice: json['totalPrice'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  final String waypointSymbol;
  final String shipSymbol;
  final int totalPrice;
  final DateTime timestamp;

  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol,
      'shipSymbol': shipSymbol,
      'totalPrice': totalPrice,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
