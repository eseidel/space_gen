import 'package:spacetraders/model/ship_cargo.dart';

class GetMyShipCargo200Response {
  GetMyShipCargo200Response({
    required this.data,
  });

  factory GetMyShipCargo200Response.fromJson(Map<String, dynamic> json) {
    return GetMyShipCargo200Response(
      data: ShipCargo.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final ShipCargo data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
