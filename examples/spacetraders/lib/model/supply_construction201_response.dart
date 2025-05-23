import 'package:spacetraders/model/supply_construction201_response_data.dart';

class SupplyConstruction201Response {
  SupplyConstruction201Response({required this.data});

  factory SupplyConstruction201Response.fromJson(Map<String, dynamic> json) {
    return SupplyConstruction201Response(
      data: SupplyConstruction201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final SupplyConstruction201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
