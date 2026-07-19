import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_condition_event_component.dart';
import 'package:spacetraders/models/ship_condition_event_symbol.dart';

/// {@template ship_condition_event}
/// An event that represents damage or wear to a ship's reactor, frame, or
/// engine, reducing the condition of the ship.
/// {@endtemplate}
@immutable
class ShipConditionEvent {
  /// {@macro ship_condition_event}
  const ShipConditionEvent({
    required this.symbol,
    required this.component,
    required this.name,
    required this.description,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipConditionEvent].
  factory ShipConditionEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipConditionEvent',
      json,
      () => ShipConditionEvent(
        symbol: ShipConditionEventSymbol.fromJson(json['symbol'] as String),
        component: ShipConditionEventComponent.fromJson(
          json['component'] as String,
        ),
        name: json['name'] as String,
        description: json['description'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipConditionEvent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipConditionEvent.fromJson(json);
  }

  /// The symbol of the event that occurred.
  final ShipConditionEventSymbol symbol;
  final ShipConditionEventComponent component;

  /// The name of the event.
  final String name;

  /// A description of the event.
  final String description;

  /// Converts a [ShipConditionEvent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'component': component.toJson(),
      'name': name,
      'description': description,
    };
  }

  @override
  int get hashCode => Object.hashAll([symbol, component, name, description]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipConditionEvent &&
        symbol == other.symbol &&
        component == other.component &&
        name == other.name &&
        description == other.description;
  }
}
