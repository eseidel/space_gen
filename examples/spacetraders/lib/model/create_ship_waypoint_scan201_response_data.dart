import 'package:meta/meta.dart';
import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/scanned_waypoint.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class CreateShipWaypointScan201ResponseData {
  const CreateShipWaypointScan201ResponseData({
    required this.cooldown,
    this.waypoints = const [],
  });

  factory CreateShipWaypointScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipWaypointScan201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      waypoints: (json['waypoints'] as List)
          .map<ScannedWaypoint>(
            (e) => ScannedWaypoint.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateShipWaypointScan201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateShipWaypointScan201ResponseData.fromJson(json);
  }

  final Cooldown cooldown;
  final List<ScannedWaypoint> waypoints;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'waypoints': waypoints.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hash(cooldown, waypoints);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateShipWaypointScan201ResponseData &&
        cooldown == other.cooldown &&
        listsEqual(waypoints, other.waypoints);
  }
}
