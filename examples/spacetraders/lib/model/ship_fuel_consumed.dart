class ShipFuelConsumed {
  ShipFuelConsumed({required this.amount, required this.timestamp});

  factory ShipFuelConsumed.fromJson(Map<String, dynamic> json) {
    return ShipFuelConsumed(
      amount: json['amount'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  final int amount;
  final DateTime timestamp;

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'timestamp': timestamp.toIso8601String()};
  }
}
