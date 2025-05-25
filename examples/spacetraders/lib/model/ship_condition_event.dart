import 'package:meta/meta.dart';
import 'package:spacetraders/model/ship_condition_event_component.dart';
import 'package:spacetraders/model/ship_condition_event_symbol.dart';

@immutable
class ShipConditionEvent {
  const ShipConditionEvent({
    required this.symbol,
    required this.component,
    required this.name,
    required this.description,
  });

  factory ShipConditionEvent.fromJson(Map<String, dynamic> json) {
    return ShipConditionEvent(
      symbol: ShipConditionEventSymbol.fromJson(json['symbol'] as String),
      component: ShipConditionEventComponent.fromJson(
        json['component'] as String,
      ),
      name: json['name'] as String,
      description: json['description'] as String,
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

  final ShipConditionEventSymbol symbol;
  final ShipConditionEventComponent component;
  final String name;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'component': component.toJson(),
      'name': name,
      'description': description,
    };
  }

  @override
  int get hashCode => Object.hash(symbol, component, name, description);

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
