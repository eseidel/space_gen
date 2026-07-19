import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/waypoint_orbital.dart';
import 'package:spacetraders/models/waypoint_symbol.dart';
import 'package:spacetraders/models/waypoint_type.dart';

/// {@template system_waypoint}
/// Waypoint details.
/// {@endtemplate}
@immutable
class SystemWaypoint {
  /// {@macro system_waypoint}
  const SystemWaypoint({
    required this.symbol,
    required this.type,
    required this.x,
    required this.y,
    required this.orbitals,
    this.orbits,
  });

  /// Converts a `Map<String, dynamic>` to a [SystemWaypoint].
  factory SystemWaypoint.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SystemWaypoint',
      json,
      () => SystemWaypoint(
        symbol: WaypointSymbol.fromJson(json['symbol'] as String),
        type: WaypointType.fromJson(json['type'] as String),
        x: json['x'] as int,
        y: json['y'] as int,
        orbitals: (json['orbitals'] as List)
            .map<WaypointOrbital>(
              (e) => WaypointOrbital.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        orbits: json['orbits'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SystemWaypoint? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SystemWaypoint.fromJson(json);
  }

  /// The symbol of the waypoint.
  final WaypointSymbol symbol;

  /// The type of waypoint.
  final WaypointType type;

  /// Relative position of the waypoint on the system's x axis. This is not an
  /// absolute position in the universe.
  final int x;

  /// Relative position of the waypoint on the system's y axis. This is not an
  /// absolute position in the universe.
  final int y;

  /// Waypoints that orbit this waypoint.
  final List<WaypointOrbital> orbitals;

  /// The symbol of the parent waypoint, if this waypoint is in orbit around
  /// another waypoint. Otherwise this value is undefined.
  final String? orbits;

  /// Converts a [SystemWaypoint] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'type': type.toJson(),
      'x': x,
      'y': y,
      'orbitals': orbitals.map((e) => e.toJson()).toList(),
      if (orbits != null) 'orbits': orbits,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([symbol, type, x, y, listHash(orbitals), orbits]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SystemWaypoint &&
        symbol == other.symbol &&
        type == other.type &&
        x == other.x &&
        y == other.y &&
        listsEqual(orbitals, other.orbitals) &&
        orbits == other.orbits;
  }
}
