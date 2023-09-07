import 'package:spacetraders/model/shipyard.dart';

class GetShipyard200Response {
  GetShipyard200Response({
    required this.data,
  });

  factory GetShipyard200Response.fromJson(Map<String, dynamic> json) {
    return GetShipyard200Response(
      data: Shipyard.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Shipyard data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
