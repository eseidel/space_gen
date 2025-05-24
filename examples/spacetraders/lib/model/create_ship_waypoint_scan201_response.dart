import 'package:spacetraders/model/create_ship_waypoint_scan201_response_data.dart';

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

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
