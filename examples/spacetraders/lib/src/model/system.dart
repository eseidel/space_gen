import 'package:spacetraders/src/model/system_faction.dart';
import 'package:spacetraders/src/model/system_type.dart';
import 'package:spacetraders/src/model/system_waypoint.dart';

class System {
  System({
    required this.symbol,
    required this.sectorSymbol,
    required this.type,
    required this.x,
    required this.y,
    required this.waypoints,
    required this.factions,
  });

  factory System.fromJson(Map<String, dynamic> json) {
    return System(
      symbol: json['symbol'] as String,
      sectorSymbol: json['sectorSymbol'] as String,
      type: SystemType.fromJson(json['type'] as String),
      x: json['x'] as int,
      y: json['y'] as int,
      waypoints: (json['waypoints'] as List<dynamic>)
          .map<SystemWaypoint>(
            (e) => SystemWaypoint.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      factions: (json['factions'] as List<dynamic>)
          .map<SystemFaction>(
            (e) => SystemFaction.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  final String symbol;
  final String sectorSymbol;
  final SystemType type;
  final int x;
  final int y;
  final List<SystemWaypoint> waypoints;
  final List<SystemFaction> factions;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'sectorSymbol': sectorSymbol,
      'type': type.toJson(),
      'x': x,
      'y': y,
      'waypoints': waypoints.map((e) => e.toJson()).toList(),
      'factions': factions.map((e) => e.toJson()).toList(),
    };
  }
}
