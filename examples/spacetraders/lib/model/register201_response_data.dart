import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/contract.dart';
import 'package:spacetraders/model/faction.dart';
import 'package:spacetraders/model/ship.dart';

class Register201ResponseData {
  Register201ResponseData({
    required this.token,
    required this.agent,
    required this.faction,
    required this.contract,
    required this.ships,
  });

  factory Register201ResponseData.fromJson(Map<String, dynamic> json) {
    return Register201ResponseData(
      token: json['token'] as String,
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      faction: Faction.fromJson(json['faction'] as Map<String, dynamic>),
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
      ships:
          (json['ships'] as List<dynamic>)
              .map<Ship>((e) => Ship.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  final String token;
  final Agent agent;
  final Faction faction;
  final Contract contract;
  final List<Ship> ships;

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'agent': agent.toJson(),
      'faction': faction.toJson(),
      'contract': contract.toJson(),
      'ships': ships.map((e) => e.toJson()).toList(),
    };
  }
}
