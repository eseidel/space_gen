import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/market_transaction.dart';
import 'package:spacetraders/model/ship_cargo.dart';

class PurchaseCargo201ResponseData {
  PurchaseCargo201ResponseData({
    required this.agent,
    required this.cargo,
    required this.transaction,
  });

  factory PurchaseCargo201ResponseData.fromJson(Map<String, dynamic> json) {
    return PurchaseCargo201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      transaction: MarketTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final ShipCargo cargo;
  final MarketTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}
