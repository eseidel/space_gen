import 'package:spacetraders/model/repair_ship200_response_data.dart';

class RepairShip200Response {
  RepairShip200Response({required this.data});

  factory RepairShip200Response.fromJson(Map<String, dynamic> json) {
    return RepairShip200Response(
      data: RepairShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final RepairShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
