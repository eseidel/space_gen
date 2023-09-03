import 'package:spacetraders/src/model/ship_requirements.dart';

class ShipModule {
  ShipModule({
    required this.symbol,
    required this.capacity,
    required this.range,
    required this.name,
    required this.description,
    required this.requirements,
  });

  factory ShipModule.fromJson(Map<String, dynamic> json) {
    return ShipModule(
      symbol: json['symbol'] as String,
      capacity: json['capacity'] as int,
      range: json['range'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final String symbol;
  final int capacity;
  final int range;
  final String name;
  final String description;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'capacity': capacity,
      'range': range,
      'name': name,
      'description': description,
      'requirements': requirements.toJson(),
    };
  }
}
