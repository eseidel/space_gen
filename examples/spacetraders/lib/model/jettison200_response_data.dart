import 'package:spacetraders/model/ship_cargo.dart';

class Jettison200ResponseData {
  Jettison200ResponseData({required this.cargo});

  factory Jettison200ResponseData.fromJson(Map<String, dynamic> json) {
    return Jettison200ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Jettison200ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Jettison200ResponseData.fromJson(json);
  }

  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {'cargo': cargo.toJson()};
  }
}
