import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/ship_modification_transaction.dart';
import 'package:spacetraders/model/ship_module.dart';

class InstallShipModule201Response {
  InstallShipModule201Response({required this.data});

  factory InstallShipModule201Response.fromJson(Map<String, dynamic> json) {
    return InstallShipModule201Response(
      data: InstallShipModule201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final InstallShipModule201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class InstallShipModule201ResponseData {
  InstallShipModule201ResponseData({
    required this.agent,
    required this.modules,
    required this.cargo,
    required this.transaction,
  });

  factory InstallShipModule201ResponseData.fromJson(Map<String, dynamic> json) {
    return InstallShipModule201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      modules:
          (json['modules'] as List<dynamic>)
              .map<ShipModule>(
                (e) => ShipModule.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      transaction: ShipModificationTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final List<ShipModule> modules;
  final ShipCargo cargo;
  final ShipModificationTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'modules': modules.map((e) => e.toJson()).toList(),
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}
