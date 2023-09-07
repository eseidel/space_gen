import 'package:spacetraders/model/ship_cargo.dart';

class Jettison200Response {
  Jettison200Response({
    required this.data,
  });

  factory Jettison200Response.fromJson(Map<String, dynamic> json) {
    return Jettison200Response(
      data: Jettison200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final Jettison200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class Jettison200ResponseData {
  Jettison200ResponseData({
    required this.cargo,
  });

  factory Jettison200ResponseData.fromJson(Map<String, dynamic> json) {
    return Jettison200ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
    };
  }
}
