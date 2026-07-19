import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/create_ship_waypoint_scan201_response_data.dart';

/// {@template create_ship_waypoint_scan201_response}
/// Successfully scanned for nearby waypoints.
/// {@endtemplate}
@immutable
class CreateShipWaypointScan201Response {
  /// {@macro create_ship_waypoint_scan201_response}
  const CreateShipWaypointScan201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a
  /// [CreateShipWaypointScan201Response].
  factory CreateShipWaypointScan201Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CreateShipWaypointScan201Response',
      json,
      () => CreateShipWaypointScan201Response(
        data: CreateShipWaypointScan201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateShipWaypointScan201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateShipWaypointScan201Response.fromJson(json);
  }

  final CreateShipWaypointScan201ResponseData data;

  /// Converts a [CreateShipWaypointScan201Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateShipWaypointScan201Response && data == other.data;
  }
}
