import 'package:spacetraders/model/ship_nav_route_waypoint.dart';

class ShipNavRoute {
  ShipNavRoute({
    required this.destination,
    required this.origin,
    required this.departureTime,
    required this.arrival,
  });

  factory ShipNavRoute.fromJson(Map<String, dynamic> json) {
    return ShipNavRoute(
      destination: ShipNavRouteWaypoint.fromJson(
        json['destination'] as Map<String, dynamic>,
      ),
      origin: ShipNavRouteWaypoint.fromJson(
        json['origin'] as Map<String, dynamic>,
      ),
      departureTime: DateTime.parse(json['departureTime'] as String),
      arrival: DateTime.parse(json['arrival'] as String),
    );
  }

  final ShipNavRouteWaypoint destination;
  final ShipNavRouteWaypoint origin;
  final DateTime departureTime;
  final DateTime arrival;

  Map<String, dynamic> toJson() {
    return {
      'destination': destination.toJson(),
      'origin': origin.toJson(),
      'departureTime': departureTime.toIso8601String(),
      'arrival': arrival.toIso8601String(),
    };
  }
}
