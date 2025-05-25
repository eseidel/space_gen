enum ShipModuleSymbol {
  MINERAL_PROCESSOR_I._('MODULE_MINERAL_PROCESSOR_I'),
  GAS_PROCESSOR_I._('MODULE_GAS_PROCESSOR_I'),
  CARGO_HOLD_I._('MODULE_CARGO_HOLD_I'),
  CARGO_HOLD_II._('MODULE_CARGO_HOLD_II'),
  CARGO_HOLD_III._('MODULE_CARGO_HOLD_III'),
  CREW_QUARTERS_I._('MODULE_CREW_QUARTERS_I'),
  ENVOY_QUARTERS_I._('MODULE_ENVOY_QUARTERS_I'),
  PASSENGER_CABIN_I._('MODULE_PASSENGER_CABIN_I'),
  MICRO_REFINERY_I._('MODULE_MICRO_REFINERY_I'),
  ORE_REFINERY_I._('MODULE_ORE_REFINERY_I'),
  FUEL_REFINERY_I._('MODULE_FUEL_REFINERY_I'),
  SCIENCE_LAB_I._('MODULE_SCIENCE_LAB_I'),
  JUMP_DRIVE_I._('MODULE_JUMP_DRIVE_I'),
  JUMP_DRIVE_II._('MODULE_JUMP_DRIVE_II'),
  JUMP_DRIVE_III._('MODULE_JUMP_DRIVE_III'),
  WARP_DRIVE_I._('MODULE_WARP_DRIVE_I'),
  WARP_DRIVE_II._('MODULE_WARP_DRIVE_II'),
  WARP_DRIVE_III._('MODULE_WARP_DRIVE_III'),
  SHIELD_GENERATOR_I._('MODULE_SHIELD_GENERATOR_I'),
  SHIELD_GENERATOR_II._('MODULE_SHIELD_GENERATOR_II');

  const ShipModuleSymbol._(this.value);

  factory ShipModuleSymbol.fromJson(String json) {
    return ShipModuleSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () => throw FormatException('Unknown ShipModuleSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipModuleSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipModuleSymbol.fromJson(json);
  }

  final String value;

  String toJson() => value;

  @override
  String toString() => value;
}
