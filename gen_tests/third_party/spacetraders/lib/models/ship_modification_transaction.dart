import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template ship_modification_transaction}
/// Result of a transaction for a ship modification, such as installing a mount
/// or a module.
/// {@endtemplate}
@immutable
class ShipModificationTransaction {
  /// {@macro ship_modification_transaction}
  const ShipModificationTransaction({
    required this.waypointSymbol,
    required this.shipSymbol,
    required this.tradeSymbol,
    required this.totalPrice,
    required this.timestamp,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipModificationTransaction].
  factory ShipModificationTransaction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipModificationTransaction',
      json,
      () => ShipModificationTransaction(
        waypointSymbol: json['waypointSymbol'] as String,
        shipSymbol: json['shipSymbol'] as String,
        tradeSymbol: json['tradeSymbol'] as String,
        totalPrice: json['totalPrice'] as int,
        timestamp: DateTime.parse(json['timestamp'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipModificationTransaction? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ShipModificationTransaction.fromJson(json);
  }

  /// The symbol of the waypoint where the transaction took place.
  final String waypointSymbol;

  /// The symbol of the ship that made the transaction.
  final String shipSymbol;

  /// The symbol of the trade good.
  final String tradeSymbol;

  /// The total price of the transaction.
  final int totalPrice;

  /// The timestamp of the transaction.
  final DateTime timestamp;

  /// Converts a [ShipModificationTransaction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol,
      'shipSymbol': shipSymbol,
      'tradeSymbol': tradeSymbol,
      'totalPrice': totalPrice,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    waypointSymbol,
    shipSymbol,
    tradeSymbol,
    totalPrice,
    timestamp,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipModificationTransaction &&
        waypointSymbol == other.waypointSymbol &&
        shipSymbol == other.shipSymbol &&
        tradeSymbol == other.tradeSymbol &&
        totalPrice == other.totalPrice &&
        timestamp == other.timestamp;
  }
}
