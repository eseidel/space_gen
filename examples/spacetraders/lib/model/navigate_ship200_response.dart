import 'package:spacetraders/model/ship_fuel.dart';
import 'package:spacetraders/model/ship_nav.dart';

class NavigateShip200Response {
  NavigateShip200Response({
    required this.data,
  });

  factory NavigateShip200Response.fromJson(Map<String, dynamic> json) {
    return NavigateShip200Response(
      data: NavigateShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final NavigateShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

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
