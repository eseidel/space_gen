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
      symbol: ShipReactorSymbolInner.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      condition: json['condition'] as int,
      powerOutput: json['powerOutput'] as int,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipReactorSymbolInner symbol;
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

enum ShipReactorSymbolInner {
  reactorSolarI('REACTOR_SOLAR_I'),
  reactorFusionI('REACTOR_FUSION_I'),
  reactorFissionI('REACTOR_FISSION_I'),
  reactorChemicalI('REACTOR_CHEMICAL_I'),
  reactorAntimatterI('REACTOR_ANTIMATTER_I'),
  ;

  const ShipReactorSymbolInner(this.value);

  factory ShipReactorSymbolInner.fromJson(String json) {
    switch (json) {
      case 'REACTOR_SOLAR_I':
        return ShipReactorSymbolInner.reactorSolarI;
      case 'REACTOR_FUSION_I':
        return ShipReactorSymbolInner.reactorFusionI;
      case 'REACTOR_FISSION_I':
        return ShipReactorSymbolInner.reactorFissionI;
      case 'REACTOR_CHEMICAL_I':
        return ShipReactorSymbolInner.reactorChemicalI;
      case 'REACTOR_ANTIMATTER_I':
        return ShipReactorSymbolInner.reactorAntimatterI;
      default:
        throw Exception('Unknown ShipReactorSymbolInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipReactorSymbolInner.reactorSolarI:
        return 'REACTOR_SOLAR_I';
      case ShipReactorSymbolInner.reactorFusionI:
        return 'REACTOR_FUSION_I';
      case ShipReactorSymbolInner.reactorFissionI:
        return 'REACTOR_FISSION_I';
      case ShipReactorSymbolInner.reactorChemicalI:
        return 'REACTOR_CHEMICAL_I';
      case ShipReactorSymbolInner.reactorAntimatterI:
        return 'REACTOR_ANTIMATTER_I';
    }
  }
}
