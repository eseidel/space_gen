import 'package:spacetraders/model/refuel_ship200_response_data.dart';

class RefuelShip200Response {
  RefuelShip200Response({required this.data});

  factory RefuelShip200Response.fromJson(Map<String, dynamic> json) {
    return RefuelShip200Response(
      data: RefuelShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RefuelShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RefuelShip200Response.fromJson(json);
  }

  final RefuelShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
