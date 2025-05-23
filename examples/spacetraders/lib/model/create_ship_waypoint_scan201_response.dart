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

  final CreateShipWaypointScan201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
