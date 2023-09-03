import 'package:spacetraders/src/model/ship_requirements.dart';

class ShipReactor {
  ShipReactor({
    required this.symbol,
    required this.name,
    required this.description,
    required this.condition,
    required this.powerOutput,
    required this.requirements,
  });

  factory ShipReactor.fromJson(Map<String, dynamic> json) {
    return ShipReactor(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      condition: json['condition'] as int,
      powerOutput: json['powerOutput'] as int,
      requirements: ShipRequirements.fromJson(
          json['requirements'] as Map<String, dynamic>,),
    );
  }

  final String symbol;
  final String name;
  final String description;
  final int condition;
  final int powerOutput;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'description': description,
      'condition': condition,
      'powerOutput': powerOutput,
      'requirements': requirements.toJson(),
    };
  }
}
