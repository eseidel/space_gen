import 'package:meta/meta.dart';
import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/contract.dart';
import 'package:spacetraders/model/faction.dart';
import 'package:spacetraders/model/ship.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class Register201ResponseData {
  const Register201ResponseData({
    required this.token,
    required this.agent,
    required this.faction,
    required this.contract,
    this.ships = const [],
  });

  factory Register201ResponseData.fromJson(Map<String, dynamic> json) {
    return Register201ResponseData(
      token: json['token'] as String,
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      faction: Faction.fromJson(json['faction'] as Map<String, dynamic>),
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
      ships: (json['ships'] as List)
          .map<Ship>((e) => Ship.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Register201ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Register201ResponseData.fromJson(json);
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

  @override
  int get hashCode => Object.hash(token, agent, faction, contract, ships);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Register201ResponseData &&
        token == other.token &&
        agent == other.agent &&
        faction == other.faction &&
        contract == other.contract &&
        listsEqual(ships, other.ships);
  }
}
