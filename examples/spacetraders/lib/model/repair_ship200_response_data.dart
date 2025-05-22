import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/repair_transaction.dart';
import 'package:spacetraders/model/ship.dart';

class RepairShip200ResponseData {
  RepairShip200ResponseData({
    required this.agent,
    required this.ship,
    required this.transaction,
  });

  factory RepairShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return RepairShip200ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      ship: Ship.fromJson(json['ship'] as Map<String, dynamic>),
      transaction: RepairTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final Ship ship;
  final RepairTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'ship': ship.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}
