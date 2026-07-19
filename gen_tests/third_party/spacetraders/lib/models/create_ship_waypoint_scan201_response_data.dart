import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/cooldown.dart';
import 'package:spacetraders/models/scanned_waypoint.dart';

@immutable
class CreateShipWaypointScan201ResponseData {
  const CreateShipWaypointScan201ResponseData({
    required this.cooldown,
    required this.waypoints,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CreateShipWaypointScan201ResponseData].
  factory CreateShipWaypointScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CreateShipWaypointScan201ResponseData',
      json,
      () => CreateShipWaypointScan201ResponseData(
        cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
        waypoints: (json['waypoints'] as List)
            .map<ScannedWaypoint>(
              (e) => ScannedWaypoint.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
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

  /// A cooldown is a period of time in which a ship cannot perform certain
  /// actions.
  final Cooldown cooldown;

  /// List of scanned waypoints.
  final List<ScannedWaypoint> waypoints;

  /// Converts a [CreateShipWaypointScan201ResponseData]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'waypoints': waypoints.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([cooldown, listHash(waypoints)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateShipWaypointScan201ResponseData &&
        cooldown == other.cooldown &&
        listsEqual(waypoints, other.waypoints);
  }
}
