class ShipyardTransaction {
  ShipyardTransaction({
    required this.waypointSymbol,
    required this.shipSymbol,
    required this.price,
    required this.agentSymbol,
    required this.timestamp,
  });

  factory ShipyardTransaction.fromJson(Map<String, dynamic> json) {
    return ShipyardTransaction(
      waypointSymbol: json['waypointSymbol'] as String,
      shipSymbol: json['shipSymbol'] as String,
      price: json['price'] as int,
      agentSymbol: json['agentSymbol'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  final String waypointSymbol;
  final String shipSymbol;
  final int price;
  final String agentSymbol;
  final DateTime timestamp;

  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol,
      'shipSymbol': shipSymbol,
      'price': price,
      'agentSymbol': agentSymbol,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
