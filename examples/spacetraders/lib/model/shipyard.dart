import 'package:meta/meta.dart';
import 'package:spacetraders/model/shipyard_ship.dart';
import 'package:spacetraders/model/shipyard_ship_types_inner.dart';
import 'package:spacetraders/model/shipyard_transaction.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class Shipyard {
  const Shipyard({
    required this.symbol,
    required this.modificationsFee,
    this.shipTypes = const [],
    this.transactions = const [],
    this.ships = const [],
  });

  factory Shipyard.fromJson(Map<String, dynamic> json) {
    return Shipyard(
      symbol: json['symbol'] as String,
      shipTypes:
          (json['shipTypes'] as List)
              .map<ShipyardShipTypesInner>(
                (e) =>
                    ShipyardShipTypesInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      transactions:
          (json['transactions'] as List)
              .map<ShipyardTransaction>(
                (e) => ShipyardTransaction.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      ships:
          (json['ships'] as List)
              .map<ShipyardShip>(
                (e) => ShipyardShip.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      modificationsFee: json['modificationsFee'] as int,
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

  final String symbol;
  final List<ShipyardShipTypesInner> shipTypes;
  final List<ShipyardTransaction>? transactions;
  final List<ShipyardShip>? ships;
  final int modificationsFee;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'shipTypes': shipTypes.map((e) => e.toJson()).toList(),
      'transactions': transactions?.map((e) => e.toJson()).toList(),
      'ships': ships?.map((e) => e.toJson()).toList(),
      'modificationsFee': modificationsFee,
    };
  }

  @override
  int get hashCode =>
      Object.hash(symbol, shipTypes, transactions, ships, modificationsFee);

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
