enum ShipType {
  PROBE._('SHIP_PROBE'),
  MINING_DRONE._('SHIP_MINING_DRONE'),
  SIPHON_DRONE._('SHIP_SIPHON_DRONE'),
  INTERCEPTOR._('SHIP_INTERCEPTOR'),
  LIGHT_HAULER._('SHIP_LIGHT_HAULER'),
  COMMAND_FRIGATE._('SHIP_COMMAND_FRIGATE'),
  EXPLORER._('SHIP_EXPLORER'),
  HEAVY_FREIGHTER._('SHIP_HEAVY_FREIGHTER'),
  LIGHT_SHUTTLE._('SHIP_LIGHT_SHUTTLE'),
  ORE_HOUND._('SHIP_ORE_HOUND'),
  REFINING_FREIGHTER._('SHIP_REFINING_FREIGHTER'),
  SURVEYOR._('SHIP_SURVEYOR'),
  BULK_FREIGHTER._('SHIP_BULK_FREIGHTER');

  const ShipType._(this.value);

  factory ShipType.fromJson(String json) {
    return ShipType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipType.fromJson(json);
  }

  final String value;

  String toJson() => value;
}
