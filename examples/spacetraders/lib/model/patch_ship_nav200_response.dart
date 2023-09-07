import 'package:spacetraders/model/ship_nav.dart';

class PatchShipNav200Response {
  PatchShipNav200Response({
    required this.data,
  });

  factory PatchShipNav200Response.fromJson(Map<String, dynamic> json) {
    return PatchShipNav200Response(
      data: ShipNav.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final ShipNav data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
