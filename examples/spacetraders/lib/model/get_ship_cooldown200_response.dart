import 'package:spacetraders/model/cooldown.dart';

class GetShipCooldown200Response {
  GetShipCooldown200Response({
    required this.data,
  });

  factory GetShipCooldown200Response.fromJson(Map<String, dynamic> json) {
    return GetShipCooldown200Response(
      data: Cooldown.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Cooldown data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
