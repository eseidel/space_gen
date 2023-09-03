import 'package:spacetraders/src/model/ship_requirements.dart';

class ShipFrame {
  ShipFrame({
    required this.symbol,
    required this.name,
    required this.description,
    required this.condition,
    required this.moduleSlots,
    required this.mountingPoints,
    required this.fuelCapacity,
    required this.requirements,
  });

  factory ShipFrame.fromJson(Map<String, dynamic> json) {
    return ShipFrame(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      condition: json['condition'] as int,
      moduleSlots: json['moduleSlots'] as int,
      mountingPoints: json['mountingPoints'] as int,
      fuelCapacity: json['fuelCapacity'] as int,
      requirements: ShipRequirements.fromJson(
          json['requirements'] as Map<String, dynamic>,),
    );
  }

  final String symbol;
  final String name;
  final String description;
  final int condition;
  final int moduleSlots;
  final int mountingPoints;
  final int fuelCapacity;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'description': description,
      'condition': condition,
      'moduleSlots': moduleSlots,
      'mountingPoints': mountingPoints,
      'fuelCapacity': fuelCapacity,
      'requirements': requirements.toJson(),
    };
  }
}
