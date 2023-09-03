import 'package:spacetraders/src/model/ship_requirements.dart';

class ShipEngine {
  ShipEngine({
    required this.symbol,
    required this.name,
    required this.description,
    required this.condition,
    required this.speed,
    required this.requirements,
  });

  factory ShipEngine.fromJson(Map<String, dynamic> json) {
    return ShipEngine(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      condition: json['condition'] as int,
      speed: json['speed'] as int,
      requirements: ShipRequirements.fromJson(
          json['requirements'] as Map<String, dynamic>,),
    );
  }

  final String symbol;
  final String name;
  final String description;
  final int condition;
  final int speed;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'description': description,
      'condition': condition,
      'speed': speed,
      'requirements': requirements.toJson(),
    };
  }
}
