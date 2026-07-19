import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/waypoint_symbol.dart';

/// {@template shipyard_transaction}
/// Results of a transaction with a shipyard.
/// {@endtemplate}
@immutable
class ShipyardTransaction {
  /// {@macro shipyard_transaction}
  const ShipyardTransaction({
    required this.waypointSymbol,
    @deprecated required this.shipSymbol,
    required this.shipType,
    required this.price,
    required this.agentSymbol,
    required this.timestamp,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipyardTransaction].
  factory ShipyardTransaction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipyardTransaction',
      json,
      () => ShipyardTransaction(
        waypointSymbol: WaypointSymbol.fromJson(
          json['waypointSymbol'] as String,
        ),
        shipSymbol: json['shipSymbol'] as String,
        shipType: json['shipType'] as String,
        price: json['price'] as int,
        agentSymbol: json['agentSymbol'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipyardTransaction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipyardTransaction.fromJson(json);
  }

  /// The symbol of the waypoint.
  final WaypointSymbol waypointSymbol;

  /// The symbol of the ship type (e.g. SHIP_MINING_DRONE) that was the
  /// subject of the transaction. Contrary to what the name implies, this is
  /// NOT the symbol of the ship that was purchased.
  @deprecated
  final String shipSymbol;

  /// The symbol of the ship type (e.g. SHIP_MINING_DRONE) that was the
  /// subject of the transaction.
  final String shipType;

  /// The price of the transaction.
  final int price;

  /// The symbol of the agent that made the transaction.
  final String agentSymbol;

  /// The timestamp of the transaction.
  final DateTime timestamp;

  /// Converts a [ShipyardTransaction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol.toJson(),
      'shipSymbol': shipSymbol,
      'shipType': shipType,
      'price': price,
      'agentSymbol': agentSymbol,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    waypointSymbol,
    shipSymbol,
    shipType,
    price,
    agentSymbol,
    timestamp,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipyardTransaction &&
        waypointSymbol == other.waypointSymbol &&
        shipSymbol == other.shipSymbol &&
        shipType == other.shipType &&
        price == other.price &&
        agentSymbol == other.agentSymbol &&
        timestamp == other.timestamp;
  }
}
