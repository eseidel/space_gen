import 'package:spacetraders/model/ship_requirements.dart';

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
      symbol: ShipEngineSymbolInner.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      condition: json['condition'] as int,
      speed: json['speed'] as int,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipEngineSymbolInner symbol;
  final String name;
  final String description;
  final int condition;
  final int speed;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'condition': condition,
      'speed': speed,
      'requirements': requirements.toJson(),
    };
  }
}

enum ShipEngineSymbolInner {
  engineImpulseDriveI('ENGINE_IMPULSE_DRIVE_I'),
  engineIonDriveI('ENGINE_ION_DRIVE_I'),
  engineIonDriveIi('ENGINE_ION_DRIVE_II'),
  engineHyperDriveI('ENGINE_HYPER_DRIVE_I'),
  ;

  const ShipEngineSymbolInner(this.value);

  factory ShipEngineSymbolInner.fromJson(String json) {
    return ShipEngineSymbolInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw Exception('Unknown ShipEngineSymbolInner value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
