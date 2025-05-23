import 'package:spacetraders/model/refuel_ship200_response_data.dart';

class RefuelShip200Response {
  RefuelShip200Response({required this.data});

  factory RefuelShip200Response.fromJson(Map<String, dynamic> json) {
    return RefuelShip200Response(
      data: RefuelShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final RefuelShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
