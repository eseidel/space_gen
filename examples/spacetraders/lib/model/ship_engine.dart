import 'package:spacetraders/model/ship_requirements.dart';

class ShipEngine {
  ShipEngine({
    required this.symbol,
    required this.name,
    required this.condition,
    required this.integrity,
    required this.description,
    required this.speed,
    required this.requirements,
    required this.quality,
  });

  factory ShipEngine.fromJson(Map<String, dynamic> json) {
    return ShipEngine(
      symbol: ShipEngineSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      condition: json['condition'] as double,
      integrity: json['integrity'] as double,
      description: json['description'] as String,
      speed: json['speed'] as int,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
      quality: json['quality'] as double,
    );
  }

  final ShipEngineSymbol symbol;
  final String name;
  final double condition;
  final double integrity;
  final String description;
  final int speed;
  final ShipRequirements requirements;
  final double quality;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'condition': condition,
      'integrity': integrity,
      'description': description,
      'speed': speed,
      'requirements': requirements.toJson(),
      'quality': quality,
    };
  }
}

enum ShipEngineSymbol {
  IMPULSE_DRIVE_I('ENGINE_IMPULSE_DRIVE_I'),
  ION_DRIVE_I('ENGINE_ION_DRIVE_I'),
  ION_DRIVE_II('ENGINE_ION_DRIVE_II'),
  HYPER_DRIVE_I('ENGINE_HYPER_DRIVE_I');

  const ShipEngineSymbol(this.value);

  factory ShipEngineSymbol.fromJson(String json) {
    return ShipEngineSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipEngineSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
