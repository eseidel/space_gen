import 'package:meta/meta.dart';
import 'package:spacetraders/model/ship_condition_event.dart';
import 'package:spacetraders/model/ship_fuel.dart';
import 'package:spacetraders/model/ship_nav.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class NavigateShip200ResponseData {
  const NavigateShip200ResponseData({
    required this.nav,
    required this.fuel,
    this.events = const [],
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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NavigateShip200ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return NavigateShip200ResponseData.fromJson(json);
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

  @override
  int get hashCode => Object.hash(nav, fuel, events);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NavigateShip200ResponseData &&
        nav == other.nav &&
        fuel == other.fuel &&
        listsEqual(events, other.events);
  }
}
