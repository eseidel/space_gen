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

  final ScrapShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
