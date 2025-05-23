import 'package:spacetraders/model/ship_type.dart';

class ShipyardShipTypesItem {
  ShipyardShipTypesItem({required this.type});

  factory ShipyardShipTypesItem.fromJson(Map<String, dynamic> json) {
    return ShipyardShipTypesItem(
      type: ShipType.fromJson(json['type'] as String),
    );
  }

  final ShipType type;

  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }
}
