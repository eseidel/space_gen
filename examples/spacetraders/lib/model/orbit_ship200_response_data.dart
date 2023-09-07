import 'package:spacetraders/model/ship_nav.dart';

class OrbitShip200ResponseData {
  OrbitShip200ResponseData({
    required this.nav,
  });

  factory OrbitShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return OrbitShip200ResponseData(
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {
      'nav': nav.toJson(),
    };
  }
}
