import 'package:spacetraders/model/orbit_ship200_response_data.dart';

class OrbitShip200Response {
  OrbitShip200Response({required this.data});

  factory OrbitShip200Response.fromJson(Map<String, dynamic> json) {
    return OrbitShip200Response(
      data: OrbitShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final OrbitShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
