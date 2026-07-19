import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_nav_route_waypoint.dart';

/// {@template ship_nav_route}
/// The routing information for the ship's most recent transit or current
/// location.
/// {@endtemplate}
@immutable
class ShipNavRoute {
  /// {@macro ship_nav_route}
  const ShipNavRoute({
    required this.destination,
    required this.origin,
    required this.departureTime,
    required this.arrival,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipNavRoute].
  factory ShipNavRoute.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipNavRoute',
      json,
      () => ShipNavRoute(
        destination: ShipNavRouteWaypoint.fromJson(
          json['destination'] as Map<String, dynamic>,
        ),
        origin: ShipNavRouteWaypoint.fromJson(
          json['origin'] as Map<String, dynamic>,
        ),
        departureTime: DateTime.parse(json['departureTime'] as String),
        arrival: DateTime.parse(json['arrival'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipNavRoute? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipNavRoute.fromJson(json);
  }

  /// The destination or departure of a ships nav route.
  final ShipNavRouteWaypoint destination;

  /// The destination or departure of a ships nav route.
  final ShipNavRouteWaypoint origin;

  /// The date time of the ship's departure.
  final DateTime departureTime;

  /// The date time of the ship's arrival. If the ship is in-transit, this is
  /// the expected time of arrival.
  final DateTime arrival;

  /// Converts a [ShipNavRoute] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'destination': destination.toJson(),
      'origin': origin.toJson(),
      'departureTime': departureTime.toIso8601String(),
      'arrival': arrival.toIso8601String(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([destination, origin, departureTime, arrival]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipNavRoute &&
        destination == other.destination &&
        origin == other.origin &&
        departureTime == other.departureTime &&
        arrival == other.arrival;
  }
}
