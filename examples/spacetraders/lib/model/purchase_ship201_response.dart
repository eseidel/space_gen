import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/ship.dart';
import 'package:spacetraders/model/shipyard_transaction.dart';

class PurchaseShip201Response {
  PurchaseShip201Response({required this.data});

  factory PurchaseShip201Response.fromJson(Map<String, dynamic> json) {
    return PurchaseShip201Response(
      data: PurchaseShip201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final PurchaseShip201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class PurchaseShip201ResponseData {
  PurchaseShip201ResponseData({
    required this.ship,
    required this.agent,
    required this.transaction,
  });

  factory PurchaseShip201ResponseData.fromJson(Map<String, dynamic> json) {
    return PurchaseShip201ResponseData(
      ship: Ship.fromJson(json['ship'] as Map<String, dynamic>),
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      transaction: ShipyardTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Ship ship;
  final Agent agent;
  final ShipyardTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'ship': ship.toJson(),
      'agent': agent.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}
