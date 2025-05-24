import 'package:spacetraders/model/ship_type.dart';

class ShipyardShipTypesInner {
  ShipyardShipTypesInner({required this.type});

  factory ShipyardShipTypesInner.fromJson(Map<String, dynamic> json) {
    return ShipyardShipTypesInner(
      type: ShipType.fromJson(json['type'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipyardShipTypesInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipyardShipTypesInner.fromJson(json);
  }

  final ShipType type;

  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }
}
