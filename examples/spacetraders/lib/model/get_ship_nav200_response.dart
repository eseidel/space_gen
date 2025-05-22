import 'package:spacetraders/model/ship_nav.dart';

class GetShipNav200Response {
  GetShipNav200Response({required this.data});

  factory GetShipNav200Response.fromJson(Map<String, dynamic> json) {
    return GetShipNav200Response(
      data: ShipNav.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final ShipNav data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
