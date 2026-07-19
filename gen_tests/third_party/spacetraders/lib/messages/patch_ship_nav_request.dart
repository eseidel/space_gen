import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_nav_flight_mode.dart';

@immutable
class PatchShipNavRequest {
  const PatchShipNavRequest({this.flightMode = ShipNavFlightMode.cruise});

  /// Converts a `Map<String, dynamic>` to a [PatchShipNavRequest].
  factory PatchShipNavRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PatchShipNavRequest',
      json,
      () => PatchShipNavRequest(
        flightMode:
            ShipNavFlightMode.maybeFromJson(json['flightMode'] as String?) ??
            ShipNavFlightMode.cruise,
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

  /// The ship's set speed when traveling between waypoints or systems.
  final ShipNavFlightMode? flightMode;

  /// Converts a [PatchShipNavRequest] to a `Map<String, dynamic>`.
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
