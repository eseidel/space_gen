import 'package:spacetraders/model/ship_condition_event.dart';
import 'package:spacetraders/model/ship_fuel.dart';
import 'package:spacetraders/model/ship_nav.dart';

class NavigateShip200Response {
  NavigateShip200Response({required this.data});

  factory NavigateShip200Response.fromJson(Map<String, dynamic> json) {
    return NavigateShip200Response(
      data: NavigateShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final NavigateShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class NavigateShip200ResponseData {
  NavigateShip200ResponseData({
    required this.nav,
    required this.fuel,
    required this.events,
  });

  factory NavigateShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return NavigateShip200ResponseData(
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
      fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
      events:
          (json['events'] as List<dynamic>)
              .map<ShipConditionEvent>(
                (e) => ShipConditionEvent.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  final ShipNav nav;
  final ShipFuel fuel;
  final List<ShipConditionEvent> events;

  Map<String, dynamic> toJson() {
    return {
      'nav': nav.toJson(),
      'fuel': fuel.toJson(),
      'events': events.map((e) => e.toJson()).toList(),
    };
  }
}
