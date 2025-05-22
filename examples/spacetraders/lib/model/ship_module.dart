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
  moduleMineralProcessorI('MODULE_MINERAL_PROCESSOR_I'),
  moduleGasProcessorI('MODULE_GAS_PROCESSOR_I'),
  moduleCargoHoldI('MODULE_CARGO_HOLD_I'),
  moduleCargoHoldIi('MODULE_CARGO_HOLD_II'),
  moduleCargoHoldIii('MODULE_CARGO_HOLD_III'),
  moduleCrewQuartersI('MODULE_CREW_QUARTERS_I'),
  moduleEnvoyQuartersI('MODULE_ENVOY_QUARTERS_I'),
  modulePassengerCabinI('MODULE_PASSENGER_CABIN_I'),
  moduleMicroRefineryI('MODULE_MICRO_REFINERY_I'),
  moduleOreRefineryI('MODULE_ORE_REFINERY_I'),
  moduleFuelRefineryI('MODULE_FUEL_REFINERY_I'),
  moduleScienceLabI('MODULE_SCIENCE_LAB_I'),
  moduleJumpDriveI('MODULE_JUMP_DRIVE_I'),
  moduleJumpDriveIi('MODULE_JUMP_DRIVE_II'),
  moduleJumpDriveIii('MODULE_JUMP_DRIVE_III'),
  moduleWarpDriveI('MODULE_WARP_DRIVE_I'),
  moduleWarpDriveIi('MODULE_WARP_DRIVE_II'),
  moduleWarpDriveIii('MODULE_WARP_DRIVE_III'),
  moduleShieldGeneratorI('MODULE_SHIELD_GENERATOR_I'),
  moduleShieldGeneratorIi('MODULE_SHIELD_GENERATOR_II');

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
