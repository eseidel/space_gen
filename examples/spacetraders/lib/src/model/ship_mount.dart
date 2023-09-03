import 'package:spacetraders/src/model/ship_requirements.dart';

class ShipMount {
  ShipMount({
    required this.symbol,
    required this.name,
    required this.description,
    required this.strength,
    required this.deposits,
    required this.requirements,
  });

  factory ShipMount.fromJson(Map<String, dynamic> json) {
    return ShipMount(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      strength: json['strength'] as int,
      deposits: (json['deposits'] as List<dynamic>).cast<String>(),
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final String symbol;
  final String name;
  final String description;
  final int strength;
  final List<String> deposits;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'description': description,
      'strength': strength,
      'deposits': deposits,
      'requirements': requirements.toJson(),
    };
  }
}
