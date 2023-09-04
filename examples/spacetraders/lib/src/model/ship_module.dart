import 'package:spacetraders/src/model/ship_requirements.dart';

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
      symbol: ShipModuleSymbolString.fromJson(json['symbol'] as String),
      capacity: json['capacity'] as int,
      range: json['range'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipModuleSymbolString symbol;
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

enum ShipModuleSymbolString {
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

  const ShipModuleSymbolString(this.value);

  factory ShipModuleSymbolString.fromJson(String json) {
    switch (json) {
      case 'MODULE_MINERAL_PROCESSOR_I':
        return ShipModuleSymbolString.moduleMineralProcessorI;
      case 'MODULE_CARGO_HOLD_I':
        return ShipModuleSymbolString.moduleCargoHoldI;
      case 'MODULE_CREW_QUARTERS_I':
        return ShipModuleSymbolString.moduleCrewQuartersI;
      case 'MODULE_ENVOY_QUARTERS_I':
        return ShipModuleSymbolString.moduleEnvoyQuartersI;
      case 'MODULE_PASSENGER_CABIN_I':
        return ShipModuleSymbolString.modulePassengerCabinI;
      case 'MODULE_MICRO_REFINERY_I':
        return ShipModuleSymbolString.moduleMicroRefineryI;
      case 'MODULE_ORE_REFINERY_I':
        return ShipModuleSymbolString.moduleOreRefineryI;
      case 'MODULE_FUEL_REFINERY_I':
        return ShipModuleSymbolString.moduleFuelRefineryI;
      case 'MODULE_SCIENCE_LAB_I':
        return ShipModuleSymbolString.moduleScienceLabI;
      case 'MODULE_JUMP_DRIVE_I':
        return ShipModuleSymbolString.moduleJumpDriveI;
      case 'MODULE_JUMP_DRIVE_II':
        return ShipModuleSymbolString.moduleJumpDriveIi;
      case 'MODULE_JUMP_DRIVE_III':
        return ShipModuleSymbolString.moduleJumpDriveIii;
      case 'MODULE_WARP_DRIVE_I':
        return ShipModuleSymbolString.moduleWarpDriveI;
      case 'MODULE_WARP_DRIVE_II':
        return ShipModuleSymbolString.moduleWarpDriveIi;
      case 'MODULE_WARP_DRIVE_III':
        return ShipModuleSymbolString.moduleWarpDriveIii;
      case 'MODULE_SHIELD_GENERATOR_I':
        return ShipModuleSymbolString.moduleShieldGeneratorI;
      case 'MODULE_SHIELD_GENERATOR_II':
        return ShipModuleSymbolString.moduleShieldGeneratorIi;
      default:
        throw Exception('Unknown ShipModuleSymbolString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipModuleSymbolString.moduleMineralProcessorI:
        return 'MODULE_MINERAL_PROCESSOR_I';
      case ShipModuleSymbolString.moduleCargoHoldI:
        return 'MODULE_CARGO_HOLD_I';
      case ShipModuleSymbolString.moduleCrewQuartersI:
        return 'MODULE_CREW_QUARTERS_I';
      case ShipModuleSymbolString.moduleEnvoyQuartersI:
        return 'MODULE_ENVOY_QUARTERS_I';
      case ShipModuleSymbolString.modulePassengerCabinI:
        return 'MODULE_PASSENGER_CABIN_I';
      case ShipModuleSymbolString.moduleMicroRefineryI:
        return 'MODULE_MICRO_REFINERY_I';
      case ShipModuleSymbolString.moduleOreRefineryI:
        return 'MODULE_ORE_REFINERY_I';
      case ShipModuleSymbolString.moduleFuelRefineryI:
        return 'MODULE_FUEL_REFINERY_I';
      case ShipModuleSymbolString.moduleScienceLabI:
        return 'MODULE_SCIENCE_LAB_I';
      case ShipModuleSymbolString.moduleJumpDriveI:
        return 'MODULE_JUMP_DRIVE_I';
      case ShipModuleSymbolString.moduleJumpDriveIi:
        return 'MODULE_JUMP_DRIVE_II';
      case ShipModuleSymbolString.moduleJumpDriveIii:
        return 'MODULE_JUMP_DRIVE_III';
      case ShipModuleSymbolString.moduleWarpDriveI:
        return 'MODULE_WARP_DRIVE_I';
      case ShipModuleSymbolString.moduleWarpDriveIi:
        return 'MODULE_WARP_DRIVE_II';
      case ShipModuleSymbolString.moduleWarpDriveIii:
        return 'MODULE_WARP_DRIVE_III';
      case ShipModuleSymbolString.moduleShieldGeneratorI:
        return 'MODULE_SHIELD_GENERATOR_I';
      case ShipModuleSymbolString.moduleShieldGeneratorIi:
        return 'MODULE_SHIELD_GENERATOR_II';
    }
  }
}
