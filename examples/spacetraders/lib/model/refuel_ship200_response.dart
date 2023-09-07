import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/market_transaction.dart';
import 'package:spacetraders/model/ship_fuel.dart';

class RefuelShip200Response {
  RefuelShip200Response({
    required this.data,
  });

  factory RefuelShip200Response.fromJson(Map<String, dynamic> json) {
    return RefuelShip200Response(
      data: RefuelShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final RefuelShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class RefuelShip200ResponseData {
  RefuelShip200ResponseData({
    required this.agent,
    required this.fuel,
    required this.transaction,
  });

  factory RefuelShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return RefuelShip200ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
      transaction: MarketTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final ShipFuel fuel;
  final MarketTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'fuel': fuel.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}
