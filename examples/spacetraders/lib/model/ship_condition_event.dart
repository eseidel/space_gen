import 'package:spacetraders/model/ship_condition_event_component.dart';
import 'package:spacetraders/model/ship_condition_event_symbol.dart';

class ShipConditionEvent {
  ShipConditionEvent({
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
}
