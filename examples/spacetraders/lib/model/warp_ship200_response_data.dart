import 'package:spacetraders/model/ship_condition_event.dart';
import 'package:spacetraders/model/ship_fuel.dart';
import 'package:spacetraders/model/ship_nav.dart';

class WarpShip200ResponseData {
  WarpShip200ResponseData({
    required this.nav,
    required this.fuel,
    this.events = const [],
  });

  factory WarpShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return WarpShip200ResponseData(
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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WarpShip200ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WarpShip200ResponseData.fromJson(json);
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
