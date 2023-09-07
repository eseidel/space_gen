import 'package:spacetraders/model/ship_requirements.dart';

class ShipModule {
  ShipModule({
    required this.symbol,
    required this.capacity,
    required this.range,
    required this.name,
    required this.description,
    required this.requirements,
  });

  factory ShipModule.fromJson(Map<String, dynamic> json) {
    return ShipModule(
      symbol: ShipModuleSymbolInner.fromJson(json['symbol'] as String),
      capacity: json['capacity'] as int,
      range: json['range'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipModuleSymbolInner symbol;
  final int capacity;
  final int range;
  final String name;
  final String description;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'capacity': capacity,
      'range': range,
      'name': name,
      'description': description,
      'requirements': requirements.toJson(),
    };
  }
}

enum ShipModuleSymbolInner {
  moduleMineralProcessorI('MODULE_MINERAL_PROCESSOR_I'),
  moduleCargoHoldI('MODULE_CARGO_HOLD_I'),
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
  moduleShieldGeneratorIi('MODULE_SHIELD_GENERATOR_II'),
  ;

  const ShipModuleSymbolInner(this.value);

  factory ShipModuleSymbolInner.fromJson(String json) {
    switch (json) {
      case 'MODULE_MINERAL_PROCESSOR_I':
        return ShipModuleSymbolInner.moduleMineralProcessorI;
      case 'MODULE_CARGO_HOLD_I':
        return ShipModuleSymbolInner.moduleCargoHoldI;
      case 'MODULE_CREW_QUARTERS_I':
        return ShipModuleSymbolInner.moduleCrewQuartersI;
      case 'MODULE_ENVOY_QUARTERS_I':
        return ShipModuleSymbolInner.moduleEnvoyQuartersI;
      case 'MODULE_PASSENGER_CABIN_I':
        return ShipModuleSymbolInner.modulePassengerCabinI;
      case 'MODULE_MICRO_REFINERY_I':
        return ShipModuleSymbolInner.moduleMicroRefineryI;
      case 'MODULE_ORE_REFINERY_I':
        return ShipModuleSymbolInner.moduleOreRefineryI;
      case 'MODULE_FUEL_REFINERY_I':
        return ShipModuleSymbolInner.moduleFuelRefineryI;
      case 'MODULE_SCIENCE_LAB_I':
        return ShipModuleSymbolInner.moduleScienceLabI;
      case 'MODULE_JUMP_DRIVE_I':
        return ShipModuleSymbolInner.moduleJumpDriveI;
      case 'MODULE_JUMP_DRIVE_II':
        return ShipModuleSymbolInner.moduleJumpDriveIi;
      case 'MODULE_JUMP_DRIVE_III':
        return ShipModuleSymbolInner.moduleJumpDriveIii;
      case 'MODULE_WARP_DRIVE_I':
        return ShipModuleSymbolInner.moduleWarpDriveI;
      case 'MODULE_WARP_DRIVE_II':
        return ShipModuleSymbolInner.moduleWarpDriveIi;
      case 'MODULE_WARP_DRIVE_III':
        return ShipModuleSymbolInner.moduleWarpDriveIii;
      case 'MODULE_SHIELD_GENERATOR_I':
        return ShipModuleSymbolInner.moduleShieldGeneratorI;
      case 'MODULE_SHIELD_GENERATOR_II':
        return ShipModuleSymbolInner.moduleShieldGeneratorIi;
      default:
        throw Exception('Unknown ShipModuleSymbolInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipModuleSymbolInner.moduleMineralProcessorI:
        return 'MODULE_MINERAL_PROCESSOR_I';
      case ShipModuleSymbolInner.moduleCargoHoldI:
        return 'MODULE_CARGO_HOLD_I';
      case ShipModuleSymbolInner.moduleCrewQuartersI:
        return 'MODULE_CREW_QUARTERS_I';
      case ShipModuleSymbolInner.moduleEnvoyQuartersI:
        return 'MODULE_ENVOY_QUARTERS_I';
      case ShipModuleSymbolInner.modulePassengerCabinI:
        return 'MODULE_PASSENGER_CABIN_I';
      case ShipModuleSymbolInner.moduleMicroRefineryI:
        return 'MODULE_MICRO_REFINERY_I';
      case ShipModuleSymbolInner.moduleOreRefineryI:
        return 'MODULE_ORE_REFINERY_I';
      case ShipModuleSymbolInner.moduleFuelRefineryI:
        return 'MODULE_FUEL_REFINERY_I';
      case ShipModuleSymbolInner.moduleScienceLabI:
        return 'MODULE_SCIENCE_LAB_I';
      case ShipModuleSymbolInner.moduleJumpDriveI:
        return 'MODULE_JUMP_DRIVE_I';
      case ShipModuleSymbolInner.moduleJumpDriveIi:
        return 'MODULE_JUMP_DRIVE_II';
      case ShipModuleSymbolInner.moduleJumpDriveIii:
        return 'MODULE_JUMP_DRIVE_III';
      case ShipModuleSymbolInner.moduleWarpDriveI:
        return 'MODULE_WARP_DRIVE_I';
      case ShipModuleSymbolInner.moduleWarpDriveIi:
        return 'MODULE_WARP_DRIVE_II';
      case ShipModuleSymbolInner.moduleWarpDriveIii:
        return 'MODULE_WARP_DRIVE_III';
      case ShipModuleSymbolInner.moduleShieldGeneratorI:
        return 'MODULE_SHIELD_GENERATOR_I';
      case ShipModuleSymbolInner.moduleShieldGeneratorIi:
        return 'MODULE_SHIELD_GENERATOR_II';
    }
  }
}
