import 'package:spacetraders/model/ship_nav_flight_mode.dart';

class PatchShipNavRequest {
  PatchShipNavRequest({this.flightMode = ShipNavFlightMode.CRUISE});

  factory PatchShipNavRequest.fromJson(Map<String, dynamic> json) {
    return PatchShipNavRequest(
      flightMode: ShipNavFlightMode.fromJson(json['flightMode'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PatchShipNavRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PatchShipNavRequest.fromJson(json);
  }

  final ShipNavFlightMode? flightMode;

  Map<String, dynamic> toJson() {
    return {'flightMode': flightMode?.toJson()};
  }
}
