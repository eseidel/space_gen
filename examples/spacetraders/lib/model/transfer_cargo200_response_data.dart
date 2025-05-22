import 'package:spacetraders/model/ship_cargo.dart';

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
