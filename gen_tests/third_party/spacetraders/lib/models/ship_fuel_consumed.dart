import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template ship_fuel_consumed}
/// An object that only shows up when an action has consumed fuel in the
/// process. Shows the fuel consumption data.
/// {@endtemplate}
@immutable
class ShipFuelConsumed {
  /// {@macro ship_fuel_consumed}
  const ShipFuelConsumed({required this.amount, required this.timestamp});

  /// Converts a `Map<String, dynamic>` to a [ShipFuelConsumed].
  factory ShipFuelConsumed.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipFuelConsumed',
      json,
      () => ShipFuelConsumed(
        amount: json['amount'] as int,
        timestamp: DateTime.parse(json['timestamp'] as String),
      ),
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

  /// The amount of fuel consumed by the most recent transit or action.
  final int amount;

  /// The time at which the fuel was consumed.
  final DateTime timestamp;

  /// Converts a [ShipFuelConsumed] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'amount': amount, 'timestamp': timestamp.toIso8601String()};
  }

  @override
  int get hashCode => Object.hashAll([amount, timestamp]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipFuelConsumed &&
        amount == other.amount &&
        timestamp == other.timestamp;
  }
}
