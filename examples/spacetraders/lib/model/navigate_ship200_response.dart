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

  final NavigateShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
