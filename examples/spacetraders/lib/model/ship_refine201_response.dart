import 'package:spacetraders/model/ship_refine201_response_data.dart';

class ShipRefine201Response {
  ShipRefine201Response({required this.data});

  factory ShipRefine201Response.fromJson(Map<String, dynamic> json) {
    return ShipRefine201Response(
      data: ShipRefine201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipRefine201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
