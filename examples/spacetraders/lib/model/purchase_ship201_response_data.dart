import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/ship.dart';
import 'package:spacetraders/model/shipyard_transaction.dart';

class PurchaseShip201ResponseData {
  PurchaseShip201ResponseData({
    required this.agent,
    required this.ship,
    required this.transaction,
  });

  factory PurchaseShip201ResponseData.fromJson(Map<String, dynamic> json) {
    return PurchaseShip201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      ship: Ship.fromJson(json['ship'] as Map<String, dynamic>),
      transaction: ShipyardTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final Ship ship;
  final ShipyardTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'ship': ship.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}
