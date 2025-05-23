import 'package:spacetraders/model/get_scrap_ship200_response_data.dart';

class GetScrapShip200Response {
  GetScrapShip200Response({required this.data});

  factory GetScrapShip200Response.fromJson(Map<String, dynamic> json) {
    return GetScrapShip200Response(
      data: GetScrapShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final GetScrapShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
