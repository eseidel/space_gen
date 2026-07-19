import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_fuel_consumed.dart';

/// {@template ship_fuel}
/// Details of the ship's fuel tanks including how much fuel was consumed during
/// the last transit or action.
/// {@endtemplate}
@immutable
class ShipFuel {
  /// {@macro ship_fuel}
  const ShipFuel({
    required this.current,
    required this.capacity,
    this.consumed,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipFuel].
  factory ShipFuel.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipFuel',
      json,
      () => ShipFuel(
        current: json['current'] as int,
        capacity: json['capacity'] as int,
        consumed: ShipFuelConsumed.maybeFromJson(
          json['consumed'] as Map<String, dynamic>?,
        ),
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

  /// The current amount of fuel in the ship's tanks.
  final int current;

  /// The maximum amount of fuel the ship's tanks can hold.
  final int capacity;

  /// An object that only shows up when an action has consumed fuel in the
  /// process. Shows the fuel consumption data.
  final ShipFuelConsumed? consumed;

  /// Converts a [ShipFuel] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'capacity': capacity,
      'consumed': ?consumed?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([current, capacity, consumed]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipFuel &&
        current == other.current &&
        capacity == other.capacity &&
        consumed == other.consumed;
  }
}
