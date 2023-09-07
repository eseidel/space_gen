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
    return ShipReactorSymbolInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw Exception('Unknown ShipReactorSymbolInner value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
