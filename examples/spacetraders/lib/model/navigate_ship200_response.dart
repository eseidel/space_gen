import 'package:spacetraders/model/navigate_ship200_response_data.dart';

class NavigateShip200Response {
  NavigateShip200Response({required this.data});

  factory NavigateShip200Response.fromJson(Map<String, dynamic> json) {
    return NavigateShip200Response(
      data: NavigateShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NavigateShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return NavigateShip200Response.fromJson(json);
  }

  final NavigateShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
