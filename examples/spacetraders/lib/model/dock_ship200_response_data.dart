import 'package:spacetraders/model/ship_nav.dart';

class DockShip200ResponseData {
  DockShip200ResponseData({required this.nav});

  factory DockShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return DockShip200ResponseData(
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {'nav': nav.toJson()};
  }
}
