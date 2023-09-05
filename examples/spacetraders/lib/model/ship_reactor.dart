import 'package:spacetraders/model/ship_requirements.dart';

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
      symbol: ShipReactorSymbolString.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      condition: json['condition'] as int,
      powerOutput: json['powerOutput'] as int,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipReactorSymbolString symbol;
  final String name;
  final String description;
  final int condition;
  final int powerOutput;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'condition': condition,
      'powerOutput': powerOutput,
      'requirements': requirements.toJson(),
    };
  }
}

enum ShipReactorSymbolString {
  reactorSolarI('REACTOR_SOLAR_I'),
  reactorFusionI('REACTOR_FUSION_I'),
  reactorFissionI('REACTOR_FISSION_I'),
  reactorChemicalI('REACTOR_CHEMICAL_I'),
  reactorAntimatterI('REACTOR_ANTIMATTER_I'),
  ;

  const ShipReactorSymbolString(this.value);

  factory ShipReactorSymbolString.fromJson(String json) {
    switch (json) {
      case 'REACTOR_SOLAR_I':
        return ShipReactorSymbolString.reactorSolarI;
      case 'REACTOR_FUSION_I':
        return ShipReactorSymbolString.reactorFusionI;
      case 'REACTOR_FISSION_I':
        return ShipReactorSymbolString.reactorFissionI;
      case 'REACTOR_CHEMICAL_I':
        return ShipReactorSymbolString.reactorChemicalI;
      case 'REACTOR_ANTIMATTER_I':
        return ShipReactorSymbolString.reactorAntimatterI;
      default:
        throw Exception('Unknown ShipReactorSymbolString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipReactorSymbolString.reactorSolarI:
        return 'REACTOR_SOLAR_I';
      case ShipReactorSymbolString.reactorFusionI:
        return 'REACTOR_FUSION_I';
      case ShipReactorSymbolString.reactorFissionI:
        return 'REACTOR_FISSION_I';
      case ShipReactorSymbolString.reactorChemicalI:
        return 'REACTOR_CHEMICAL_I';
      case ShipReactorSymbolString.reactorAntimatterI:
        return 'REACTOR_ANTIMATTER_I';
    }
  }
}
