import 'package:meta/meta.dart';

@immutable
class ShipFuelConsumed {
  const ShipFuelConsumed({required this.amount, required this.timestamp});

  factory ShipFuelConsumed.fromJson(Map<String, dynamic> json) {
    return ShipFuelConsumed(
      amount: json['amount'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipFuelConsumed? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipFuelConsumed.fromJson(json);
  }

  final int amount;
  final DateTime timestamp;

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'timestamp': timestamp.toIso8601String()};
  }

  @override
  int get hashCode => Object.hash(amount, timestamp);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipFuelConsumed &&
        amount == other.amount &&
        timestamp == other.timestamp;
  }
}
