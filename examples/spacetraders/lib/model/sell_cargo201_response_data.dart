import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/market_transaction.dart';
import 'package:spacetraders/model/ship_cargo.dart';

class SellCargo201ResponseData {
  SellCargo201ResponseData({
    required this.cargo,
    required this.transaction,
    required this.agent,
  });

  factory SellCargo201ResponseData.fromJson(Map<String, dynamic> json) {
    return SellCargo201ResponseData(
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
