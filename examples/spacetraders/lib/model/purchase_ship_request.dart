import 'package:spacetraders/model/ship_type.dart';

class PurchaseShipRequest {
  PurchaseShipRequest({
    required this.shipType,
    required this.waypointSymbol,
  });

  factory PurchaseShipRequest.fromJson(Map<String, dynamic> json) {
    return PurchaseShipRequest(
      shipType: ShipType.fromJson(json['shipType'] as String),
      waypointSymbol: json['waypointSymbol'] as String,
    );
  }

  final ShipType shipType;
  final String waypointSymbol;

  Map<String, dynamic> toJson() {
    return {
      'shipType': shipType.toJson(),
      'waypointSymbol': waypointSymbol,
    };
  }
}
