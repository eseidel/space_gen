import 'package:spacetraders/model/ship_requirements.dart';

class ShipReactor {
  ShipReactor({
    required this.symbol,
    required this.name,
    required this.condition,
    required this.integrity,
    required this.description,
    required this.powerOutput,
    required this.requirements,
    required this.quality,
  });

  factory ShipReactor.fromJson(Map<String, dynamic> json) {
    return ShipReactor(
      symbol: ShipReactorSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      condition: json['condition'] as double,
      integrity: json['integrity'] as double,
      description: json['description'] as String,
      powerOutput: json['powerOutput'] as int,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
      quality: json['quality'] as double,
    );
  }

  final ShipReactorSymbol symbol;
  final String name;
  final double condition;
  final double integrity;
  final String description;
  final int powerOutput;
  final ShipRequirements requirements;
  final double quality;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'condition': condition,
      'integrity': integrity,
      'description': description,
      'powerOutput': powerOutput,
      'requirements': requirements.toJson(),
      'quality': quality,
    };
  }
}

enum ShipReactorSymbol {
  REACTOR_SOLAR_I('REACTOR_SOLAR_I'),
  REACTOR_FUSION_I('REACTOR_FUSION_I'),
  REACTOR_FISSION_I('REACTOR_FISSION_I'),
  REACTOR_CHEMICAL_I('REACTOR_CHEMICAL_I'),
  REACTOR_ANTIMATTER_I('REACTOR_ANTIMATTER_I');

  const ShipReactorSymbol(this.value);

  factory ShipReactorSymbol.fromJson(String json) {
    return ShipReactorSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipReactorSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
