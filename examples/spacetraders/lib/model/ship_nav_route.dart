import 'package:spacetraders/model/ship_nav_route_waypoint.dart';

class ShipNavRoute {
  ShipNavRoute({
    required this.destination,
    required this.departure,
    required this.departureTime,
    required this.arrival,
  });

  factory ShipNavRoute.fromJson(Map<String, dynamic> json) {
    return ShipNavRoute(
      destination: ShipNavRouteWaypoint.fromJson(
        json['destination'] as Map<String, dynamic>,
      ),
      departure: ShipNavRouteWaypoint.fromJson(
        json['departure'] as Map<String, dynamic>,
      ),
      departureTime: DateTime.parse(json['departureTime'] as String),
      arrival: DateTime.parse(json['arrival'] as String),
    );
  }

  final ShipNavRouteWaypoint destination;
  final ShipNavRouteWaypoint departure;
  final DateTime departureTime;
  final DateTime arrival;

  Map<String, dynamic> toJson() {
    return {
      'destination': destination.toJson(),
      'departure': departure.toJson(),
      'departureTime': departureTime.toIso8601String(),
      'arrival': arrival.toIso8601String(),
    };
  }
}
