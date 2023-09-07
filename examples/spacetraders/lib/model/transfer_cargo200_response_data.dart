import 'package:spacetraders/model/ship_cargo.dart';

class TransferCargo200ResponseData {
  TransferCargo200ResponseData({
    required this.cargo,
  });

  factory TransferCargo200ResponseData.fromJson(Map<String, dynamic> json) {
    return TransferCargo200ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
    };
  }
}
