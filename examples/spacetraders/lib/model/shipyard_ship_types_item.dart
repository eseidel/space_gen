import 'package:spacetraders/model/ship_type.dart';

class ShipyardShipTypesItem {
  ShipyardShipTypesItem({required this.type});

  factory ShipyardShipTypesItem.fromJson(Map<String, dynamic> json) {
    return ShipyardShipTypesItem(
      type: ShipType.fromJson(json['type'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipyardShipTypesItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipyardShipTypesItem.fromJson(json);
  }

  final ShipType type;

  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }
}
