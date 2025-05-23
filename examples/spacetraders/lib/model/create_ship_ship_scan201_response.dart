import 'package:spacetraders/model/create_ship_ship_scan201_response_data.dart';

class CreateShipShipScan201Response {
  CreateShipShipScan201Response({required this.data});

  factory CreateShipShipScan201Response.fromJson(Map<String, dynamic> json) {
    return CreateShipShipScan201Response(
      data: CreateShipShipScan201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateShipShipScan201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
