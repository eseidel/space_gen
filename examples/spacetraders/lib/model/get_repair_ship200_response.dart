import 'package:spacetraders/model/get_repair_ship200_response_data.dart';

class GetRepairShip200Response {
  GetRepairShip200Response({required this.data});

  factory GetRepairShip200Response.fromJson(Map<String, dynamic> json) {
    return GetRepairShip200Response(
      data: GetRepairShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetRepairShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetRepairShip200Response.fromJson(json);
  }

  final GetRepairShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
