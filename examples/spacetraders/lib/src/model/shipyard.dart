import 'package:spacetraders/src/model/shipyard_ship.dart';
import 'package:spacetraders/src/model/shipyard_transaction.dart';

class Shipyard {
  Shipyard({
    required this.symbol,
    required this.shipTypes,
    required this.transactions,
    required this.ships,
  });

  factory Shipyard.fromJson(Map<String, dynamic> json) {
    return Shipyard(
      symbol: json['symbol'] as String,
      shipTypes: (json['shipTypes'] as List<dynamic>)
          .map<ShipyardShipTypesArray>(
            (e) => ShipyardShipTypesArray.fromJson(e as Map<String, dynamic>),
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
    );
  }

  final String symbol;
  final List<ShipyardShipTypesArray> shipTypes;
  final List<ShipyardTransaction> transactions;
  final List<ShipyardShip> ships;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'shipTypes': shipTypes.map((e) => e.toJson()).toList(),
      'transactions': transactions.map((e) => e.toJson()).toList(),
      'ships': ships.map((e) => e.toJson()).toList(),
    };
  }
}

class ShipyardShipTypesArray {
  ShipyardShipTypesArray({
    required this.type,
  });

  factory ShipyardShipTypesArray.fromJson(Map<String, dynamic> json) {
    return ShipyardShipTypesArray(
      type: json['type'] as String,
    );
  }

  final String type;

  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }
}
