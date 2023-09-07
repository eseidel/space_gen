import 'package:spacetraders/model/waypoint.dart';

class GetWaypoint200Response {
  GetWaypoint200Response({
    required this.data,
  });

  factory GetWaypoint200Response.fromJson(Map<String, dynamic> json) {
    return GetWaypoint200Response(
      data: Waypoint.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Waypoint data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
