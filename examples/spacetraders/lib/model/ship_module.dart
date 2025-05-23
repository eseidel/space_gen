import 'package:spacetraders/model/ship_module_symbol.dart';
import 'package:spacetraders/model/ship_requirements.dart';

class ShipModule {
  ShipModule({
    required this.symbol,
    required this.name,
    required this.description,
    required this.capacity,
    required this.range,
    required this.requirements,
  });

  factory ShipModule.fromJson(Map<String, dynamic> json) {
    return ShipModule(
      symbol: ShipModuleSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      capacity: json['capacity'] as int,
      range: json['range'] as int,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipModuleSymbol symbol;
  final String name;
  final String description;
  final int capacity;
  final int range;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'capacity': capacity,
      'range': range,
      'requirements': requirements.toJson(),
    };
  }
}
