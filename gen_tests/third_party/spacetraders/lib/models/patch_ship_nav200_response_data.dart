import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_condition_event.dart';
import 'package:spacetraders/models/ship_fuel.dart';
import 'package:spacetraders/models/ship_nav.dart';

@immutable
class PatchShipNav200ResponseData {
  const PatchShipNav200ResponseData({
    required this.nav,
    required this.fuel,
    required this.events,
  });

  /// Converts a `Map<String, dynamic>` to a [PatchShipNav200ResponseData].
  factory PatchShipNav200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PatchShipNav200ResponseData',
      json,
      () => PatchShipNav200ResponseData(
        nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
        fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
        events: (json['events'] as List)
            .map<ShipConditionEvent>(
              (e) => ShipConditionEvent.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PatchShipNav200ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PatchShipNav200ResponseData.fromJson(json);
  }

  /// The navigation information of the ship.
  final ShipNav nav;

  /// Details of the ship's fuel tanks including how much fuel was consumed
  /// during the last transit or action.
  final ShipFuel fuel;
  final List<ShipConditionEvent> events;

  /// Converts a [PatchShipNav200ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'nav': nav.toJson(),
      'fuel': fuel.toJson(),
      'events': events.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([nav, fuel, listHash(events)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PatchShipNav200ResponseData &&
        nav == other.nav &&
        fuel == other.fuel &&
        listsEqual(events, other.events);
  }
}
