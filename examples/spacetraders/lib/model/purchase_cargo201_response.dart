import 'package:spacetraders/model/purchase_cargo201_response_data.dart';

class PurchaseCargo201Response {
  PurchaseCargo201Response({required this.data});

  factory PurchaseCargo201Response.fromJson(Map<String, dynamic> json) {
    return PurchaseCargo201Response(
      data: PurchaseCargo201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final PurchaseCargo201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
