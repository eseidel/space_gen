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
      symbol: ShipEngineSymbolString.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      condition: json['condition'] as int,
      speed: json['speed'] as int,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipEngineSymbolString symbol;
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

enum ShipEngineSymbolString {
  engineImpulseDriveI('ENGINE_IMPULSE_DRIVE_I'),
  engineIonDriveI('ENGINE_ION_DRIVE_I'),
  engineIonDriveIi('ENGINE_ION_DRIVE_II'),
  engineHyperDriveI('ENGINE_HYPER_DRIVE_I'),
  ;

  const ShipEngineSymbolString(this.value);

  factory ShipEngineSymbolString.fromJson(String json) {
    switch (json) {
      case 'ENGINE_IMPULSE_DRIVE_I':
        return ShipEngineSymbolString.engineImpulseDriveI;
      case 'ENGINE_ION_DRIVE_I':
        return ShipEngineSymbolString.engineIonDriveI;
      case 'ENGINE_ION_DRIVE_II':
        return ShipEngineSymbolString.engineIonDriveIi;
      case 'ENGINE_HYPER_DRIVE_I':
        return ShipEngineSymbolString.engineHyperDriveI;
      default:
        throw Exception('Unknown ShipEngineSymbolString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipEngineSymbolString.engineImpulseDriveI:
        return 'ENGINE_IMPULSE_DRIVE_I';
      case ShipEngineSymbolString.engineIonDriveI:
        return 'ENGINE_ION_DRIVE_I';
      case ShipEngineSymbolString.engineIonDriveIi:
        return 'ENGINE_ION_DRIVE_II';
      case ShipEngineSymbolString.engineHyperDriveI:
        return 'ENGINE_HYPER_DRIVE_I';
    }
  }
}
