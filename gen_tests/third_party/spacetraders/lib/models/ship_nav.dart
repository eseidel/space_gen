import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_nav_flight_mode.dart';
import 'package:spacetraders/models/ship_nav_route.dart';
import 'package:spacetraders/models/ship_nav_status.dart';
import 'package:spacetraders/models/system_symbol.dart';
import 'package:spacetraders/models/waypoint_symbol.dart';

/// {@template ship_nav}
/// The navigation information of the ship.
/// {@endtemplate}
@immutable
class ShipNav {
  /// {@macro ship_nav}
  const ShipNav({
    required this.systemSymbol,
    required this.waypointSymbol,
    required this.route,
    required this.status,
    this.flightMode = .cruise,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipNav].
  factory ShipNav.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipNav',
      json,
      () => ShipNav(
        systemSymbol: SystemSymbol.fromJson(json['systemSymbol'] as String),
        waypointSymbol: WaypointSymbol.fromJson(
          json['waypointSymbol'] as String,
        ),
        route: ShipNavRoute.fromJson(json['route'] as Map<String, dynamic>),
        status: ShipNavStatus.fromJson(json['status'] as String),
        flightMode: ShipNavFlightMode.fromJson(json['flightMode'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipNav? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipNav.fromJson(json);
  }

  /// The symbol of the system.
  final SystemSymbol systemSymbol;

  /// The symbol of the waypoint.
  final WaypointSymbol waypointSymbol;

  /// The routing information for the ship's most recent transit or current
  /// location.
  final ShipNavRoute route;

  /// The current status of the ship
  final ShipNavStatus status;

  /// The ship's set speed when traveling between waypoints or systems.
  final ShipNavFlightMode flightMode;

  /// Converts a [ShipNav] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'systemSymbol': systemSymbol.toJson(),
      'waypointSymbol': waypointSymbol.toJson(),
      'route': route.toJson(),
      'status': status.toJson(),
      'flightMode': flightMode.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([systemSymbol, waypointSymbol, route, status, flightMode]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipNav &&
        systemSymbol == other.systemSymbol &&
        waypointSymbol == other.waypointSymbol &&
        route == other.route &&
        status == other.status &&
        flightMode == other.flightMode;
  }
}
