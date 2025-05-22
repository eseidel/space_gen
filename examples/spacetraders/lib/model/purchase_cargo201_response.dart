import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/market_transaction.dart';
import 'package:spacetraders/model/ship_cargo.dart';

class PurchaseCargo201Response {
  PurchaseCargo201Response({required this.data});

  factory PurchaseCargo201Response.fromJson(Map<String, dynamic> json) {
    return PurchaseCargo201Response(
      data: PurchaseCargo201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final PurchaseCargo201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class PurchaseCargo201ResponseData {
  PurchaseCargo201ResponseData({
    required this.cargo,
    required this.transaction,
    required this.agent,
  });

  factory PurchaseCargo201ResponseData.fromJson(Map<String, dynamic> json) {
    return PurchaseCargo201ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      transaction: MarketTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
    );
  }

  final ShipCargo cargo;
  final MarketTransaction transaction;
  final Agent agent;

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
      'agent': agent.toJson(),
    };
  }
}
