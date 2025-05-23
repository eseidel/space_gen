import 'package:spacetraders/model/get_my_account200_response_data.dart';

class GetMyAccount200Response {
  GetMyAccount200Response({required this.data});

  factory GetMyAccount200Response.fromJson(Map<String, dynamic> json) {
    return GetMyAccount200Response(
      data: GetMyAccount200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final GetMyAccount200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
