import 'package:spacetraders/model/ship_fuel_consumed.dart';

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
      consumed: ShipFuelConsumed.fromJson(
        json['consumed'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipFuel? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipFuel.fromJson(json);
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
