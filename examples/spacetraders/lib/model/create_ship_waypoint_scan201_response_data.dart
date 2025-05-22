import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/scanned_waypoint.dart';

class CreateShipWaypointScan201ResponseData {
  CreateShipWaypointScan201ResponseData({
    required this.cooldown,
    required this.waypoints,
  });

  factory CreateShipWaypointScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipWaypointScan201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      waypoints:
          (json['waypoints'] as List<dynamic>)
              .map<ScannedWaypoint>(
                (e) => ScannedWaypoint.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  final Cooldown cooldown;
  final List<ScannedWaypoint> waypoints;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'waypoints': waypoints.map((e) => e.toJson()).toList(),
    };
  }
}
