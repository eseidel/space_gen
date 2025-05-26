import 'package:meta/meta.dart';
import 'package:spacetraders/model/ship_nav_flight_mode.dart';

@immutable
class PatchShipNavRequest {
  const PatchShipNavRequest({this.flightMode = ShipNavFlightMode.CRUISE});

  factory PatchShipNavRequest.fromJson(Map<String, dynamic> json) {
    return PatchShipNavRequest(
      flightMode: ShipNavFlightMode.maybeFromJson(
        json['flightMode'] as String?,
      ),
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

  @override
  int get hashCode => flightMode.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PatchShipNavRequest && flightMode == other.flightMode;
  }
}
