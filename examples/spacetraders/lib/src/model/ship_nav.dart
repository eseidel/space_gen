import 'package:spacetraders/src/model/ship_nav_route.dart';

class ShipNav {
  ShipNav({
    required this.systemSymbol,
    required this.waypointSymbol,
    required this.route,
    required this.status,
    required this.flightMode,
  });

  factory ShipNav.fromJson(Map<String, dynamic> json) {
    return ShipNav(
      systemSymbol: json['systemSymbol'] as String,
      waypointSymbol: json['waypointSymbol'] as String,
      route: ShipNavRoute.fromJson(json['route'] as Map<String, dynamic>),
      status: json['status'] as String,
      flightMode: json['flightMode'] as String,
    );
  }

  final String systemSymbol;
  final String waypointSymbol;
  final ShipNavRoute route;
  final String status;
  final String flightMode;

  Map<String, dynamic> toJson() {
    return {
      'systemSymbol': systemSymbol,
      'waypointSymbol': waypointSymbol,
      'route': route.toJson(),
      'status': status,
      'flightMode': flightMode,
    };
  }
}
