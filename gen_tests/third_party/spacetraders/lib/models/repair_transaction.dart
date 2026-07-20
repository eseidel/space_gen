import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/waypoint_symbol.dart';

/// {@template repair_transaction}
/// Result of a repair transaction.
/// {@endtemplate}
@immutable
class RepairTransaction {
  /// {@macro repair_transaction}
  RepairTransaction({
    required this.waypointSymbol,
    required this.shipSymbol,
    required this.totalPrice,
    required this.timestamp,
  }) {
    totalPrice.validate(min: 0);
  }

  /// Converts a `Map<String, dynamic>` to a [RepairTransaction].
  factory RepairTransaction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepairTransaction',
      json,
      () => RepairTransaction(
        waypointSymbol: WaypointSymbol.fromJson(
          json['waypointSymbol'] as String,
        ),
        shipSymbol: json['shipSymbol'] as String,
        totalPrice: json['totalPrice'] as int,
        timestamp: DateTime.parse(json['timestamp'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepairTransaction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepairTransaction.fromJson(json);
  }

  /// The symbol of the waypoint.
  final WaypointSymbol waypointSymbol;

  /// The symbol of the ship.
  final String shipSymbol;

  /// The total price of the transaction.
  final int totalPrice;

  /// The timestamp of the transaction.
  final DateTime timestamp;

  /// Converts a [RepairTransaction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol.toJson(),
      'shipSymbol': shipSymbol,
      'totalPrice': totalPrice,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([waypointSymbol, shipSymbol, totalPrice, timestamp]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepairTransaction &&
        waypointSymbol == other.waypointSymbol &&
        shipSymbol == other.shipSymbol &&
        totalPrice == other.totalPrice &&
        timestamp == other.timestamp;
  }
}
