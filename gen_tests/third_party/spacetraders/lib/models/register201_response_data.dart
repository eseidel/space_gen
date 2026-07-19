import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/contract.dart';
import 'package:spacetraders/models/faction.dart';
import 'package:spacetraders/models/ship.dart';

@immutable
class Register201ResponseData {
  const Register201ResponseData({
    required this.token,
    required this.agent,
    required this.faction,
    required this.contract,
    required this.ships,
  });

  /// Converts a `Map<String, dynamic>` to a [Register201ResponseData].
  factory Register201ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Register201ResponseData',
      json,
      () => Register201ResponseData(
        token: json['token'] as String,
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
        faction: Faction.fromJson(json['faction'] as Map<String, dynamic>),
        contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
        ships: (json['ships'] as List)
            .map<Ship>((e) => Ship.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
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

  /// A Bearer token for accessing secured API endpoints.
  final String token;

  /// Agent details.
  final Agent agent;

  /// Faction details.
  final Faction faction;

  /// Contract details.
  final Contract contract;
  final List<Ship> ships;

  /// Converts a [Register201ResponseData] to a `Map<String, dynamic>`.
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
  int get hashCode =>
      Object.hashAll([token, agent, faction, contract, listHash(ships)]);

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
