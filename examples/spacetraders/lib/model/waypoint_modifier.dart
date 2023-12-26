import 'package:spacetraders/model/waypoint_modifier_symbol.dart';

class WaypointModifier {
  WaypointModifier({
    required this.symbol,
    required this.name,
    required this.description,
  });

  factory WaypointModifier.fromJson(Map<String, dynamic> json) {
    return WaypointModifier(
      symbol: WaypointModifierSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  final WaypointModifierSymbol symbol;
  final String name;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
    };
  }
}
