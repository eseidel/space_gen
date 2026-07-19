/// Type of ship
enum ShipType {
  shipProbe._('SHIP_PROBE'),
  shipMiningDrone._('SHIP_MINING_DRONE'),
  shipSiphonDrone._('SHIP_SIPHON_DRONE'),
  shipInterceptor._('SHIP_INTERCEPTOR'),
  shipLightHauler._('SHIP_LIGHT_HAULER'),
  shipCommandFrigate._('SHIP_COMMAND_FRIGATE'),
  shipExplorer._('SHIP_EXPLORER'),
  shipHeavyFreighter._('SHIP_HEAVY_FREIGHTER'),
  shipLightShuttle._('SHIP_LIGHT_SHUTTLE'),
  shipOreHound._('SHIP_ORE_HOUND'),
  shipRefiningFreighter._('SHIP_REFINING_FREIGHTER'),
  shipSurveyor._('SHIP_SURVEYOR'),
  shipBulkFreighter._('SHIP_BULK_FREIGHTER');

  const ShipType._(this.value);

  /// Creates a ShipType from a json value.
  factory ShipType.fromJson(String json) {
    return ShipType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ShipType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipType.fromJson(json);
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
