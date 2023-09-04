class ShipFuel {
  ShipFuel({
    required this.current,
    required this.capacity,
    required this.consumed,
  });

  factory ShipFuel.fromJson(Map<String, dynamic> json) {
    return ShipFuel(
      current: json['current'] as int,
      capacity: json['capacity'] as int,
      consumed:
          ShipFuelConsumed.fromJson(json['consumed'] as Map<String, dynamic>),
    );
  }

  final int current;
  final int capacity;
  final ShipFuelConsumed consumed;

  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'capacity': capacity,
      'consumed': consumed.toJson(),
    };
  }
}

class ShipFuelConsumed {
  ShipFuelConsumed({
    required this.amount,
    required this.timestamp,
  });

  factory ShipFuelConsumed.fromJson(Map<String, dynamic> json) {
    return ShipFuelConsumed(
      amount: json['amount'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  final int amount;
  final DateTime timestamp;

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
