import 'package:spacetraders/model/jump_ship200_response_data.dart';

class JumpShip200Response {
  JumpShip200Response({required this.data});

  factory JumpShip200Response.fromJson(Map<String, dynamic> json) {
    return JumpShip200Response(
      data: JumpShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final JumpShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
