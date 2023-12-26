import 'package:spacetraders/model/construction.dart';
import 'package:spacetraders/model/ship_cargo.dart';

class SupplyConstruction201Response {
  SupplyConstruction201Response({
    required this.data,
  });

  factory SupplyConstruction201Response.fromJson(Map<String, dynamic> json) {
    return SupplyConstruction201Response(
      data: SupplyConstruction201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final SupplyConstruction201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class SupplyConstruction201ResponseData {
  SupplyConstruction201ResponseData({
    required this.construction,
    required this.cargo,
  });

  factory SupplyConstruction201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return SupplyConstruction201ResponseData(
      construction:
          Construction.fromJson(json['construction'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  final Construction construction;
  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {
      'construction': construction.toJson(),
      'cargo': cargo.toJson(),
    };
  }
}
