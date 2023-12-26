import 'package:spacetraders/model/ship_type.dart';
import 'package:spacetraders/model/shipyard_ship.dart';
import 'package:spacetraders/model/shipyard_transaction.dart';

class Shipyard {
  Shipyard({
    required this.symbol,
    required this.shipTypes,
    required this.transactions,
    required this.ships,
    required this.modificationsFee,
  });

  factory Shipyard.fromJson(Map<String, dynamic> json) {
    return Shipyard(
      symbol: json['symbol'] as String,
      shipTypes: (json['shipTypes'] as List<dynamic>)
          .map<ShipyardShipTypesInner>(
            (e) => ShipyardShipTypesInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      transactions: (json['transactions'] as List<dynamic>)
          .map<ShipyardTransaction>(
            (e) => ShipyardTransaction.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      ships: (json['ships'] as List<dynamic>)
          .map<ShipyardShip>(
            (e) => ShipyardShip.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      modificationsFee: json['modificationsFee'] as int,
    );
  }

  final String symbol;
  final List<ShipyardShipTypesInner> shipTypes;
  final List<ShipyardTransaction> transactions;
  final List<ShipyardShip> ships;
  final int modificationsFee;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'shipTypes': shipTypes.map((e) => e.toJson()).toList(),
      'transactions': transactions.map((e) => e.toJson()).toList(),
      'ships': ships.map((e) => e.toJson()).toList(),
      'modificationsFee': modificationsFee,
    };
  }
}

class ShipyardShipTypesInner {
  ShipyardShipTypesInner({
    required this.type,
  });

  factory ShipyardShipTypesInner.fromJson(Map<String, dynamic> json) {
    return ShipyardShipTypesInner(
      type: ShipType.fromJson(json['type'] as String),
    );
  }

  final ShipType type;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
    };
  }
}
