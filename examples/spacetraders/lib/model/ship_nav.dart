import 'package:meta/meta.dart';
import 'package:spacetraders/model/ship_nav_flight_mode.dart';
import 'package:spacetraders/model/ship_nav_route.dart';
import 'package:spacetraders/model/ship_nav_status.dart';

@immutable
class ShipNav {
  const ShipNav({
    required this.systemSymbol,
    required this.waypointSymbol,
    required this.route,
    required this.status,
    this.flightMode = ShipNavFlightMode.CRUISE,
  });

  factory ShipNav.fromJson(Map<String, dynamic> json) {
    return ShipNav(
      systemSymbol: json['systemSymbol'] as String,
      waypointSymbol: json['waypointSymbol'] as String,
      route: ShipNavRoute.fromJson(json['route'] as Map<String, dynamic>),
      status: ShipNavStatus.fromJson(json['status'] as String),
      flightMode: ShipNavFlightMode.fromJson(json['flightMode'] as String),
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

  final String systemSymbol;
  final String waypointSymbol;
  final ShipNavRoute route;
  final ShipNavStatus status;
  final ShipNavFlightMode flightMode;

  Map<String, dynamic> toJson() {
    return {
      'systemSymbol': systemSymbol,
      'waypointSymbol': waypointSymbol,
      'route': route.toJson(),
      'status': status.toJson(),
      'flightMode': flightMode.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hash(systemSymbol, waypointSymbol, route, status, flightMode);

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
