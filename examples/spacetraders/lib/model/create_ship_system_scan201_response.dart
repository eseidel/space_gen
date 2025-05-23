import 'package:spacetraders/model/create_ship_system_scan201_response_data.dart';

class CreateShipSystemScan201Response {
  CreateShipSystemScan201Response({required this.data});

  factory CreateShipSystemScan201Response.fromJson(Map<String, dynamic> json) {
    return CreateShipSystemScan201Response(
      data: CreateShipSystemScan201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateShipSystemScan201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
