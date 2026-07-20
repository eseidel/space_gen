import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/system_symbol.dart';
import 'package:spacetraders/models/waypoint_type.dart';

/// {@template ship_nav_route_waypoint}
/// The destination or departure of a ships nav route.
/// {@endtemplate}
@immutable
class ShipNavRouteWaypoint {
  /// {@macro ship_nav_route_waypoint}
  ShipNavRouteWaypoint({
    required this.symbol,
    required this.type,
    required this.systemSymbol,
    required this.x,
    required this.y,
  }) {
    symbol.validate(minLength: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [ShipNavRouteWaypoint].
  factory ShipNavRouteWaypoint.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipNavRouteWaypoint',
      json,
      () => ShipNavRouteWaypoint(
        symbol: json['symbol'] as String,
        type: WaypointType.fromJson(json['type'] as String),
        systemSymbol: SystemSymbol.fromJson(json['systemSymbol'] as String),
        x: json['x'] as int,
        y: json['y'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipNavRouteWaypoint? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipNavRouteWaypoint.fromJson(json);
  }

  /// The symbol of the waypoint.
  final String symbol;

  /// The type of waypoint.
  final WaypointType type;

  /// The symbol of the system.
  final SystemSymbol systemSymbol;

  /// Position in the universe in the x axis.
  final int x;

  /// Position in the universe in the y axis.
  final int y;

  /// Converts a [ShipNavRouteWaypoint] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type.toJson(),
      'systemSymbol': systemSymbol.toJson(),
      'x': x,
      'y': y,
    };
  }

  @override
  int get hashCode => Object.hashAll([symbol, type, systemSymbol, x, y]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipNavRouteWaypoint &&
        symbol == other.symbol &&
        type == other.type &&
        systemSymbol == other.systemSymbol &&
        x == other.x &&
        y == other.y;
  }
}
