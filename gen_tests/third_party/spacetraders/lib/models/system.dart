import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/system_faction.dart';
import 'package:spacetraders/models/system_type.dart';
import 'package:spacetraders/models/system_waypoint.dart';

/// {@template system}
/// System details.
/// {@endtemplate}
@immutable
class System {
  /// {@macro system}
  const System({
    required this.symbol,
    required this.sectorSymbol,
    required this.type,
    required this.x,
    required this.y,
    required this.waypoints,
    required this.factions,
    this.constellation,
    this.name,
  });

  /// Converts a `Map<String, dynamic>` to a [System].
  factory System.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'System',
      json,
      () => System(
        constellation: json['constellation'] as String?,
        symbol: json['symbol'] as String,
        sectorSymbol: json['sectorSymbol'] as String,
        type: SystemType.fromJson(json['type'] as String),
        x: json['x'] as int,
        y: json['y'] as int,
        waypoints: (json['waypoints'] as List)
            .map<SystemWaypoint>(
              (e) => SystemWaypoint.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        factions: (json['factions'] as List)
            .map<SystemFaction>(
              (e) => SystemFaction.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        name: json['name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static System? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return System.fromJson(json);
  }

  /// The constellation that the system is part of.
  final String? constellation;

  /// The symbol of the system.
  final String symbol;

  /// The symbol of the sector.
  final String sectorSymbol;

  /// The type of system.
  final SystemType type;

  /// Relative position of the system in the sector in the x axis.
  final int x;

  /// Relative position of the system in the sector in the y axis.
  final int y;

  /// Waypoints in this system.
  final List<SystemWaypoint> waypoints;

  /// Factions that control this system.
  final List<SystemFaction> factions;

  /// The name of the system.
  final String? name;

  /// Converts a [System] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'constellation': ?constellation,
      'symbol': symbol,
      'sectorSymbol': sectorSymbol,
      'type': type.toJson(),
      'x': x,
      'y': y,
      'waypoints': waypoints.map((e) => e.toJson()).toList(),
      'factions': factions.map((e) => e.toJson()).toList(),
      'name': ?name,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    constellation,
    symbol,
    sectorSymbol,
    type,
    x,
    y,
    listHash(waypoints),
    listHash(factions),
    name,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is System &&
        constellation == other.constellation &&
        symbol == other.symbol &&
        sectorSymbol == other.sectorSymbol &&
        type == other.type &&
        x == other.x &&
        y == other.y &&
        listsEqual(waypoints, other.waypoints) &&
        listsEqual(factions, other.factions) &&
        name == other.name;
  }
}
