import 'package:spacetraders/model/jettison200_response_data.dart';

class Jettison200Response {
  Jettison200Response({required this.data});

  factory Jettison200Response.fromJson(Map<String, dynamic> json) {
    return Jettison200Response(
      data: Jettison200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final Jettison200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
