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

  final WarpShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
