import 'package:spacetraders/model/ship_requirements.dart';

class ShipModule {
  ShipModule({
    required this.symbol,
    required this.name,
    required this.description,
    required this.capacity,
    required this.range,
    required this.requirements,
  });

  factory ShipModule.fromJson(Map<String, dynamic> json) {
    return ShipModule(
      symbol: ShipModuleSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      capacity: json['capacity'] as int,
      range: json['range'] as int,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipModuleSymbol symbol;
  final String name;
  final String description;
  final int capacity;
  final int range;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'capacity': capacity,
      'range': range,
      'requirements': requirements.toJson(),
    };
  }
}

enum ShipModuleSymbol {
  MINERAL_PROCESSOR_I('MODULE_MINERAL_PROCESSOR_I'),
  GAS_PROCESSOR_I('MODULE_GAS_PROCESSOR_I'),
  CARGO_HOLD_I('MODULE_CARGO_HOLD_I'),
  CARGO_HOLD_II('MODULE_CARGO_HOLD_II'),
  CARGO_HOLD_III('MODULE_CARGO_HOLD_III'),
  CREW_QUARTERS_I('MODULE_CREW_QUARTERS_I'),
  ENVOY_QUARTERS_I('MODULE_ENVOY_QUARTERS_I'),
  PASSENGER_CABIN_I('MODULE_PASSENGER_CABIN_I'),
  MICRO_REFINERY_I('MODULE_MICRO_REFINERY_I'),
  ORE_REFINERY_I('MODULE_ORE_REFINERY_I'),
  FUEL_REFINERY_I('MODULE_FUEL_REFINERY_I'),
  SCIENCE_LAB_I('MODULE_SCIENCE_LAB_I'),
  JUMP_DRIVE_I('MODULE_JUMP_DRIVE_I'),
  JUMP_DRIVE_II('MODULE_JUMP_DRIVE_II'),
  JUMP_DRIVE_III('MODULE_JUMP_DRIVE_III'),
  WARP_DRIVE_I('MODULE_WARP_DRIVE_I'),
  WARP_DRIVE_II('MODULE_WARP_DRIVE_II'),
  WARP_DRIVE_III('MODULE_WARP_DRIVE_III'),
  SHIELD_GENERATOR_I('MODULE_SHIELD_GENERATOR_I'),
  SHIELD_GENERATOR_II('MODULE_SHIELD_GENERATOR_II');

  const ShipModuleSymbol(this.value);

  factory ShipModuleSymbol.fromJson(String json) {
    return ShipModuleSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipModuleSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
