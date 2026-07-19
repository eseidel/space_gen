import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/orbit_ship200_response_data.dart';

/// {@template orbit_ship200_response}
/// Orbit Ship 200 Response
/// The ship has successfully moved into orbit at its current location.
/// {@endtemplate}
@immutable
class OrbitShip200Response {
  /// {@macro orbit_ship200_response}
  const OrbitShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to an [OrbitShip200Response].
  factory OrbitShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrbitShip200Response',
      json,
      () => OrbitShip200Response(
        data: OrbitShip200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrbitShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrbitShip200Response.fromJson(json);
  }

  final OrbitShip200ResponseData data;

  /// Converts an [OrbitShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrbitShip200Response && data == other.data;
  }
}
