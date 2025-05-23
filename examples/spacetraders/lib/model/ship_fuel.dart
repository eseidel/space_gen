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
