import 'package:spacetraders/model/ship_nav.dart';

class OrbitShip200ResponseData {
  OrbitShip200ResponseData({required this.nav});

  factory OrbitShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return OrbitShip200ResponseData(
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrbitShip200ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrbitShip200ResponseData.fromJson(json);
  }

  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {'nav': nav.toJson()};
  }
}
