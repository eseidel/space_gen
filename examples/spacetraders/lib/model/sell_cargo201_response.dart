import 'package:spacetraders/model/sell_cargo201_response_data.dart';

class SellCargo201Response {
  SellCargo201Response({required this.data});

  factory SellCargo201Response.fromJson(Map<String, dynamic> json) {
    return SellCargo201Response(
      data: SellCargo201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final SellCargo201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
