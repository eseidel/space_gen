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
    return ShipModuleSymbolInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw Exception('Unknown ShipModuleSymbolInner value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
