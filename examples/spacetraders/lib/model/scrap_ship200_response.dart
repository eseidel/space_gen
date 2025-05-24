import 'package:spacetraders/model/scrap_ship200_response_data.dart';

class ScrapShip200Response {
  ScrapShip200Response({required this.data});

  factory ScrapShip200Response.fromJson(Map<String, dynamic> json) {
    return ScrapShip200Response(
      data: ScrapShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScrapShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScrapShip200Response.fromJson(json);
  }

  final ScrapShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
