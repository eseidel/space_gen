import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/market_transaction_type.dart';
import 'package:spacetraders/models/waypoint_symbol.dart';

/// {@template market_transaction}
/// Result of a transaction with a market.
/// {@endtemplate}
@immutable
class MarketTransaction {
  /// {@macro market_transaction}
  const MarketTransaction({
    required this.waypointSymbol,
    required this.shipSymbol,
    required this.tradeSymbol,
    required this.type,
    required this.units,
    required this.pricePerUnit,
    required this.totalPrice,
    required this.timestamp,
  });

  /// Converts a `Map<String, dynamic>` to a [MarketTransaction].
  factory MarketTransaction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MarketTransaction',
      json,
      () => MarketTransaction(
        waypointSymbol: WaypointSymbol.fromJson(
          json['waypointSymbol'] as String,
        ),
        shipSymbol: json['shipSymbol'] as String,
        tradeSymbol: json['tradeSymbol'] as String,
        type: MarketTransactionType.fromJson(json['type'] as String),
        units: json['units'] as int,
        pricePerUnit: json['pricePerUnit'] as int,
        totalPrice: json['totalPrice'] as int,
        timestamp: DateTime.parse(json['timestamp'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MarketTransaction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MarketTransaction.fromJson(json);
  }

  /// The symbol of the waypoint.
  final WaypointSymbol waypointSymbol;

  /// The symbol of the ship that made the transaction.
  final String shipSymbol;

  /// The symbol of the trade good.
  final String tradeSymbol;

  /// The type of transaction.
  final MarketTransactionType type;

  /// The number of units of the transaction.
  final int units;

  /// The price per unit of the transaction.
  final int pricePerUnit;

  /// The total price of the transaction.
  final int totalPrice;

  /// The timestamp of the transaction.
  final DateTime timestamp;

  /// Converts a [MarketTransaction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol.toJson(),
      'shipSymbol': shipSymbol,
      'tradeSymbol': tradeSymbol,
      'type': type.toJson(),
      'units': units,
      'pricePerUnit': pricePerUnit,
      'totalPrice': totalPrice,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    waypointSymbol,
    shipSymbol,
    tradeSymbol,
    type,
    units,
    pricePerUnit,
    totalPrice,
    timestamp,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MarketTransaction &&
        waypointSymbol == other.waypointSymbol &&
        shipSymbol == other.shipSymbol &&
        tradeSymbol == other.tradeSymbol &&
        type == other.type &&
        units == other.units &&
        pricePerUnit == other.pricePerUnit &&
        totalPrice == other.totalPrice &&
        timestamp == other.timestamp;
  }
}
