import 'package:spacetraders/model/waypoint_orbital.dart';
import 'package:spacetraders/model/waypoint_type.dart';

class SystemWaypoint {
  SystemWaypoint({
    required this.symbol,
    required this.type,
    required this.x,
    required this.y,
    required this.orbitals,
    required this.orbits,
  });

  factory SystemWaypoint.fromJson(Map<String, dynamic> json) {
    return SystemWaypoint(
      symbol: json['symbol'] as String,
      type: WaypointType.fromJson(json['type'] as String),
      x: json['x'] as int,
      y: json['y'] as int,
      orbitals: (json['orbitals'] as List<dynamic>)
          .map<WaypointOrbital>(
            (e) => WaypointOrbital.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      orbits: json['orbits'] as String,
    );
  }

  final String symbol;
  final WaypointType type;
  final int x;
  final int y;
  final List<WaypointOrbital> orbitals;
  final String orbits;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type.toJson(),
      'x': x,
      'y': y,
      'orbitals': orbitals.map((e) => e.toJson()).toList(),
      'orbits': orbits,
    };
  }
}
