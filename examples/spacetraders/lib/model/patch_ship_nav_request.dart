import 'package:spacetraders/model/ship_nav_flight_mode.dart';

class PatchShipNavRequest {
  PatchShipNavRequest({this.flightMode = ShipNavFlightMode.CRUISE});

  factory PatchShipNavRequest.fromJson(Map<String, dynamic> json) {
    return PatchShipNavRequest(
      flightMode: ShipNavFlightMode.fromJson(json['flightMode'] as String),
    );
  }

  final ShipNavFlightMode flightMode;

  Map<String, dynamic> toJson() {
    return {'flightMode': flightMode.toJson()};
  }
}
