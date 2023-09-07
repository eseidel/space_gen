import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/market_transaction.dart';
import 'package:spacetraders/model/ship_cargo.dart';

class SellCargo201Response {
  SellCargo201Response({
    required this.data,
  });

  factory SellCargo201Response.fromJson(Map<String, dynamic> json) {
    return SellCargo201Response(
      data: SellCargo201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final SellCargo201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class SellCargo201ResponseData {
  SellCargo201ResponseData({
    required this.agent,
    required this.cargo,
    required this.transaction,
  });

  factory SellCargo201ResponseData.fromJson(Map<String, dynamic> json) {
    return SellCargo201ResponseData(
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
