import 'package:spacetraders/model/warp_ship200_response_data.dart';

class WarpShip200Response {
  WarpShip200Response({required this.data});

  factory WarpShip200Response.fromJson(Map<String, dynamic> json) {
    return WarpShip200Response(
      data: WarpShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WarpShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WarpShip200Response.fromJson(json);
  }

  final WarpShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
