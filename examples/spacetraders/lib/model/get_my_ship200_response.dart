import 'package:spacetraders/model/ship.dart';

class GetMyShip200Response {
  GetMyShip200Response({
    required this.data,
  });

  factory GetMyShip200Response.fromJson(Map<String, dynamic> json) {
    return GetMyShip200Response(
      data: Ship.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Ship data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
