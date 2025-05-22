enum ShipType {
  shipProbe('SHIP_PROBE'),
  shipMiningDrone('SHIP_MINING_DRONE'),
  shipSiphonDrone('SHIP_SIPHON_DRONE'),
  shipInterceptor('SHIP_INTERCEPTOR'),
  shipLightHauler('SHIP_LIGHT_HAULER'),
  shipCommandFrigate('SHIP_COMMAND_FRIGATE'),
  shipExplorer('SHIP_EXPLORER'),
  shipHeavyFreighter('SHIP_HEAVY_FREIGHTER'),
  shipLightShuttle('SHIP_LIGHT_SHUTTLE'),
  shipOreHound('SHIP_ORE_HOUND'),
  shipRefiningFreighter('SHIP_REFINING_FREIGHTER'),
  shipSurveyor('SHIP_SURVEYOR'),
  shipBulkFreighter('SHIP_BULK_FREIGHTER');

  const ShipType(this.value);

  factory ShipType.fromJson(String json) {
    return ShipType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipType value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
