import 'package:spacetraders/model/fulfill_contract200_response_data.dart';

class FulfillContract200Response {
  FulfillContract200Response({required this.data});

  factory FulfillContract200Response.fromJson(Map<String, dynamic> json) {
    return FulfillContract200Response(
      data: FulfillContract200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final FulfillContract200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
