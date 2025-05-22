import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/ship_modification_transaction.dart';
import 'package:spacetraders/model/ship_mount.dart';

class InstallMount201ResponseData {
  InstallMount201ResponseData({
    required this.agent,
    required this.mounts,
    required this.cargo,
    required this.transaction,
  });

  factory InstallMount201ResponseData.fromJson(Map<String, dynamic> json) {
    return InstallMount201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      mounts:
          (json['mounts'] as List<dynamic>)
              .map<ShipMount>(
                (e) => ShipMount.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      transaction: ShipModificationTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final List<ShipMount> mounts;
  final ShipCargo cargo;
  final ShipModificationTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'mounts': mounts.map((e) => e.toJson()).toList(),
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}
