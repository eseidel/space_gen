import 'package:meta/meta.dart';
import 'package:spacetraders/model/orbit_ship200_response_data.dart';

@immutable
class OrbitShip200Response {
  const OrbitShip200Response({required this.data});

  factory OrbitShip200Response.fromJson(Map<String, dynamic> json) {
    return OrbitShip200Response(
      data: OrbitShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
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
