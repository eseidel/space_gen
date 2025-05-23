import 'package:spacetraders/model/patch_ship_nav200_response_data.dart';

class PatchShipNav200Response {
  PatchShipNav200Response({required this.data});

  factory PatchShipNav200Response.fromJson(Map<String, dynamic> json) {
    return PatchShipNav200Response(
      data: PatchShipNav200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final PatchShipNav200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
