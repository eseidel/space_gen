import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/scanned_waypoint.dart';

class CreateShipWaypointScan201Response {
  CreateShipWaypointScan201Response({required this.data});

  factory CreateShipWaypointScan201Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipWaypointScan201Response(
      data: CreateShipWaypointScan201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateShipWaypointScan201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

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
