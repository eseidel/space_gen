import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/chart.dart';
import 'package:spacetraders/models/system_symbol.dart';
import 'package:spacetraders/models/waypoint_faction.dart';
import 'package:spacetraders/models/waypoint_orbital.dart';
import 'package:spacetraders/models/waypoint_symbol.dart';
import 'package:spacetraders/models/waypoint_trait.dart';
import 'package:spacetraders/models/waypoint_type.dart';

/// {@template scanned_waypoint}
/// A waypoint that was scanned by a ship.
/// {@endtemplate}
@immutable
class ScannedWaypoint {
  /// {@macro scanned_waypoint}
  const ScannedWaypoint({
    required this.symbol,
    required this.type,
    required this.systemSymbol,
    required this.x,
    required this.y,
    required this.orbitals,
    required this.traits,
    this.faction,
    this.chart,
  });

  /// Converts a `Map<String, dynamic>` to a [ScannedWaypoint].
  factory ScannedWaypoint.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ScannedWaypoint',
      json,
      () => ScannedWaypoint(
        symbol: WaypointSymbol.fromJson(json['symbol'] as String),
        type: WaypointType.fromJson(json['type'] as String),
        systemSymbol: SystemSymbol.fromJson(json['systemSymbol'] as String),
        x: json['x'] as int,
        y: json['y'] as int,
        orbitals: (json['orbitals'] as List)
            .map<WaypointOrbital>(
              (e) => WaypointOrbital.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        faction: WaypointFaction.maybeFromJson(
          json['faction'] as Map<String, dynamic>?,
        ),
        traits: (json['traits'] as List)
            .map<WaypointTrait>(
              (e) => WaypointTrait.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        chart: Chart.maybeFromJson(json['chart'] as Map<String, dynamic>?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedWaypoint? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedWaypoint.fromJson(json);
  }

  /// The symbol of the waypoint.
  final WaypointSymbol symbol;

  /// The type of waypoint.
  final WaypointType type;

  /// The symbol of the system.
  final SystemSymbol systemSymbol;

  /// Position in the universe in the x axis.
  final int x;

  /// Position in the universe in the y axis.
  final int y;

  /// List of waypoints that orbit this waypoint.
  final List<WaypointOrbital> orbitals;

  /// The faction that controls the waypoint.
  final WaypointFaction? faction;

  /// The traits of the waypoint.
  final List<WaypointTrait> traits;

  /// The chart of a system or waypoint, which makes the location visible to
  /// other agents.
  final Chart? chart;

  /// Converts a [ScannedWaypoint] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'type': type.toJson(),
      'systemSymbol': systemSymbol.toJson(),
      'x': x,
      'y': y,
      'orbitals': orbitals.map((e) => e.toJson()).toList(),
      'faction': faction?.toJson(),
      'traits': traits.map((e) => e.toJson()).toList(),
      'chart': chart?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    type,
    systemSymbol,
    x,
    y,
    listHash(orbitals),
    faction,
    listHash(traits),
    chart,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScannedWaypoint &&
        symbol == other.symbol &&
        type == other.type &&
        systemSymbol == other.systemSymbol &&
        x == other.x &&
        y == other.y &&
        listsEqual(orbitals, other.orbitals) &&
        faction == other.faction &&
        listsEqual(traits, other.traits) &&
        chart == other.chart;
  }
}
