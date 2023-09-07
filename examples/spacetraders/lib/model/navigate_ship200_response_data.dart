import 'package:spacetraders/model/ship_fuel.dart';
import 'package:spacetraders/model/ship_nav.dart';

class NavigateShip200ResponseData {
  NavigateShip200ResponseData({
    required this.fuel,
    required this.nav,
  });

  factory NavigateShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return NavigateShip200ResponseData(
      fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  final ShipFuel fuel;
  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {
      'fuel': fuel.toJson(),
      'nav': nav.toJson(),
    };
  }
}
