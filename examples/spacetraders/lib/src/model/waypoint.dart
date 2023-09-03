import 'package:spacetraders/src/model/chart.dart';
import 'package:spacetraders/src/model/waypoint_faction.dart';
import 'package:spacetraders/src/model/waypoint_orbital.dart';
import 'package:spacetraders/src/model/waypoint_trait.dart';

class Waypoint {
  Waypoint({
    required this.symbol,
    required this.type,
    required this.systemSymbol,
    required this.x,
    required this.y,
    required this.orbitals,
    required this.faction,
    required this.traits,
    required this.chart,
  });

  factory Waypoint.fromJson(Map<String, dynamic> json) {
    return Waypoint(
      symbol: json['symbol'] as String,
      type: json['type'] as String,
      systemSymbol: json['systemSymbol'] as String,
      x: json['x'] as int,
      y: json['y'] as int,
      orbitals: (json['orbitals'] as List<dynamic>)
          .map<WaypointOrbital>(
              (e) => WaypointOrbital.fromJson(e as Map<String, dynamic>),)
          .toList(),
      faction:
          WaypointFaction.fromJson(json['faction'] as Map<String, dynamic>),
      traits: (json['traits'] as List<dynamic>)
          .map<WaypointTrait>(
              (e) => WaypointTrait.fromJson(e as Map<String, dynamic>),)
          .toList(),
      chart: Chart.fromJson(json['chart'] as Map<String, dynamic>),
    );
  }

  final String symbol;
  final String type;
  final String systemSymbol;
  final int x;
  final int y;
  final List<WaypointOrbital> orbitals;
  final WaypointFaction faction;
  final List<WaypointTrait> traits;
  final Chart chart;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type,
      'systemSymbol': systemSymbol,
      'x': x,
      'y': y,
      'orbitals': orbitals.map((e) => e.toJson()).toList(),
      'faction': faction.toJson(),
      'traits': traits.map((e) => e.toJson()).toList(),
      'chart': chart.toJson(),
    };
  }
}
