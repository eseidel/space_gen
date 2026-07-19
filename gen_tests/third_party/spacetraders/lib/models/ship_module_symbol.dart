/// The symbol of the module.
enum ShipModuleSymbol {
  moduleMineralProcessorI._('MODULE_MINERAL_PROCESSOR_I'),
  moduleGasProcessorI._('MODULE_GAS_PROCESSOR_I'),
  moduleCargoHoldI._('MODULE_CARGO_HOLD_I'),
  moduleCargoHoldIi._('MODULE_CARGO_HOLD_II'),
  moduleCargoHoldIii._('MODULE_CARGO_HOLD_III'),
  moduleCrewQuartersI._('MODULE_CREW_QUARTERS_I'),
  moduleEnvoyQuartersI._('MODULE_ENVOY_QUARTERS_I'),
  modulePassengerCabinI._('MODULE_PASSENGER_CABIN_I'),
  moduleMicroRefineryI._('MODULE_MICRO_REFINERY_I'),
  moduleOreRefineryI._('MODULE_ORE_REFINERY_I'),
  moduleFuelRefineryI._('MODULE_FUEL_REFINERY_I'),
  moduleScienceLabI._('MODULE_SCIENCE_LAB_I'),
  moduleJumpDriveI._('MODULE_JUMP_DRIVE_I'),
  moduleJumpDriveIi._('MODULE_JUMP_DRIVE_II'),
  moduleJumpDriveIii._('MODULE_JUMP_DRIVE_III'),
  moduleWarpDriveI._('MODULE_WARP_DRIVE_I'),
  moduleWarpDriveIi._('MODULE_WARP_DRIVE_II'),
  moduleWarpDriveIii._('MODULE_WARP_DRIVE_III'),
  moduleShieldGeneratorI._('MODULE_SHIELD_GENERATOR_I'),
  moduleShieldGeneratorIi._('MODULE_SHIELD_GENERATOR_II');

  const ShipModuleSymbol._(this.value);

  /// Creates a ShipModuleSymbol from a json value.
  factory ShipModuleSymbol.fromJson(String json) {
    return ShipModuleSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ShipModuleSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipModuleSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipModuleSymbol.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
