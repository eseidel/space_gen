import 'package:spacetraders/src/model/ship_nav_route_waypoint.dart';

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
          json['destination'] as Map<String, dynamic>,),
      departure: ShipNavRouteWaypoint.fromJson(
          json['departure'] as Map<String, dynamic>,),
      departureTime: json['departureTime'] as String,
      arrival: json['arrival'] as String,
    );
  }

  final ShipNavRouteWaypoint destination;
  final ShipNavRouteWaypoint departure;
  final String departureTime;
  final String arrival;

  Map<String, dynamic> toJson() {
    return {
      'destination': destination.toJson(),
      'departure': departure.toJson(),
      'departureTime': departureTime,
      'arrival': arrival,
    };
  }
}
