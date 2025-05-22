import 'package:spacetraders/model/ship_cargo.dart';

class TransferCargo200Response {
  TransferCargo200Response({required this.data});

  factory TransferCargo200Response.fromJson(Map<String, dynamic> json) {
    return TransferCargo200Response(
      data: TransferCargo200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final TransferCargo200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class TransferCargo200ResponseData {
  TransferCargo200ResponseData({
    required this.cargo,
    required this.targetCargo,
  });

  factory TransferCargo200ResponseData.fromJson(Map<String, dynamic> json) {
    return TransferCargo200ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      targetCargo: ShipCargo.fromJson(
        json['targetCargo'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipCargo cargo;
  final ShipCargo targetCargo;

  Map<String, dynamic> toJson() {
    return {'cargo': cargo.toJson(), 'targetCargo': targetCargo.toJson()};
  }
}
