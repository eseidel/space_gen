import 'package:spacetraders/model/dock_ship200_response_data.dart';

class DockShip200Response {
  DockShip200Response({required this.data});

  factory DockShip200Response.fromJson(Map<String, dynamic> json) {
    return DockShip200Response(
      data: DockShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final DockShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
