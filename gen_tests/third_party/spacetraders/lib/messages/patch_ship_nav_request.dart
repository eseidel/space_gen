// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_nav_flight_mode.dart';

@immutable
class PatchShipNavRequest {
  const PatchShipNavRequest({this.flightMode = .cruise});

  /// Converts a `Map<String, dynamic>` to a [PatchShipNavRequest].
  factory PatchShipNavRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PatchShipNavRequest',
      json,
      () => PatchShipNavRequest(
        flightMode:
            ShipNavFlightMode.maybeFromJson(json['flightMode'] as String?) ??
            .cruise,
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
  final ShipNavFlightMode flightMode;

  /// Converts a [PatchShipNavRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'flightMode': flightMode.toJson()};
  }

  @override
  int get hashCode => flightMode.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PatchShipNavRequest && flightMode == other.flightMode;
  }
}
