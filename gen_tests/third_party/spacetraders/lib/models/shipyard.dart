import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/shipyard_ship.dart';
import 'package:spacetraders/models/shipyard_ship_types_inner.dart';
import 'package:spacetraders/models/shipyard_transaction.dart';

/// {@template shipyard}
/// Shipyard details.
/// {@endtemplate}
@immutable
class Shipyard {
  /// {@macro shipyard}
  const Shipyard({
    required this.symbol,
    required this.shipTypes,
    required this.modificationsFee,
    this.transactions,
    this.ships,
  });

  /// Converts a `Map<String, dynamic>` to a [Shipyard].
  factory Shipyard.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Shipyard',
      json,
      () => Shipyard(
        symbol: json['symbol'] as String,
        shipTypes: (json['shipTypes'] as List)
            .map<ShipyardShipTypesInner>(
              (e) => ShipyardShipTypesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        transactions: (json['transactions'] as List?)
            ?.map<ShipyardTransaction>(
              (e) => ShipyardTransaction.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        ships: (json['ships'] as List?)
            ?.map<ShipyardShip>(
              (e) => ShipyardShip.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        modificationsFee: json['modificationsFee'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Shipyard? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Shipyard.fromJson(json);
  }

  /// The symbol of the shipyard. The symbol is the same as the waypoint where
  /// the shipyard is located.
  final String symbol;

  /// The list of ship types available for purchase at this shipyard.
  final List<ShipyardShipTypesInner> shipTypes;

  /// The list of recent transactions at this shipyard.
  final List<ShipyardTransaction>? transactions;

  /// The ships that are currently available for purchase at the shipyard.
  final List<ShipyardShip>? ships;

  /// The fee to modify a ship at this shipyard. This includes installing or
  /// removing modules and mounts on a ship. In the case of mounts, the fee is
  /// a flat rate per mount. In the case of modules, the fee is per slot the
  /// module occupies.
  final int modificationsFee;

  /// Converts a [Shipyard] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'shipTypes': shipTypes.map((e) => e.toJson()).toList(),
      if (transactions != null)
        'transactions': transactions?.map((e) => e.toJson()).toList(),
      if (ships != null) 'ships': ships?.map((e) => e.toJson()).toList(),
      'modificationsFee': modificationsFee,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    listHash(shipTypes),
    listHash(transactions),
    listHash(ships),
    modificationsFee,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Shipyard &&
        symbol == other.symbol &&
        listsEqual(shipTypes, other.shipTypes) &&
        listsEqual(transactions, other.transactions) &&
        listsEqual(ships, other.ships) &&
        modificationsFee == other.modificationsFee;
  }
}
