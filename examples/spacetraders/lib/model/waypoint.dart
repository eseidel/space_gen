import 'package:spacetraders/model/chart.dart';
import 'package:spacetraders/model/waypoint_faction.dart';
import 'package:spacetraders/model/waypoint_modifier.dart';
import 'package:spacetraders/model/waypoint_orbital.dart';
import 'package:spacetraders/model/waypoint_trait.dart';
import 'package:spacetraders/model/waypoint_type.dart';

class Waypoint {
  Waypoint({
    required this.symbol,
    required this.type,
    required this.systemSymbol,
    required this.x,
    required this.y,
    required this.orbitals,
    required this.orbits,
    required this.faction,
    required this.traits,
    required this.modifiers,
    required this.chart,
    required this.isUnderConstruction,
  });

  factory Waypoint.fromJson(Map<String, dynamic> json) {
    return Waypoint(
      symbol: json['symbol'] as String,
      type: WaypointType.fromJson(json['type'] as String),
      systemSymbol: json['systemSymbol'] as String,
      x: json['x'] as int,
      y: json['y'] as int,
      orbitals: (json['orbitals'] as List<dynamic>)
          .map<WaypointOrbital>(
            (e) => WaypointOrbital.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      orbits: json['orbits'] as String,
      faction:
          WaypointFaction.fromJson(json['faction'] as Map<String, dynamic>),
      traits: (json['traits'] as List<dynamic>)
          .map<WaypointTrait>(
            (e) => WaypointTrait.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      modifiers: (json['modifiers'] as List<dynamic>)
          .map<WaypointModifier>(
            (e) => WaypointModifier.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      chart: Chart.fromJson(json['chart'] as Map<String, dynamic>),
      isUnderConstruction: json['isUnderConstruction'] as bool,
    );
  }

  final String symbol;
  final WaypointType type;
  final String systemSymbol;
  final int x;
  final int y;
  final List<WaypointOrbital> orbitals;
  final String orbits;
  final WaypointFaction faction;
  final List<WaypointTrait> traits;
  final List<WaypointModifier> modifiers;
  final Chart chart;
  final bool isUnderConstruction;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type.toJson(),
      'systemSymbol': systemSymbol,
      'x': x,
      'y': y,
      'orbitals': orbitals.map((e) => e.toJson()).toList(),
      'orbits': orbits,
      'faction': faction.toJson(),
      'traits': traits.map((e) => e.toJson()).toList(),
      'modifiers': modifiers.map((e) => e.toJson()).toList(),
      'chart': chart.toJson(),
      'isUnderConstruction': isUnderConstruction,
    };
  }
}
