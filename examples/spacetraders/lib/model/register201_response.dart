import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/contract.dart';
import 'package:spacetraders/model/faction.dart';
import 'package:spacetraders/model/ship.dart';

class Register201Response {
  Register201Response({
    required this.data,
  });

  factory Register201Response.fromJson(Map<String, dynamic> json) {
    return Register201Response(
      data: Register201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final Register201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class Register201ResponseData {
  Register201ResponseData({
    required this.agent,
    required this.contract,
    required this.faction,
    required this.ship,
    required this.token,
  });

  factory Register201ResponseData.fromJson(Map<String, dynamic> json) {
    return Register201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
      faction: Faction.fromJson(json['faction'] as Map<String, dynamic>),
      ship: Ship.fromJson(json['ship'] as Map<String, dynamic>),
      token: json['token'] as String,
    );
  }

  final Agent agent;
  final Contract contract;
  final Faction faction;
  final Ship ship;
  final String token;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'contract': contract.toJson(),
      'faction': faction.toJson(),
      'ship': ship.toJson(),
      'token': token,
    };
  }
}
