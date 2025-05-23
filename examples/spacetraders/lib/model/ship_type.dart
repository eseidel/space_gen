enum ShipType {
  PROBE('SHIP_PROBE'),
  MINING_DRONE('SHIP_MINING_DRONE'),
  SIPHON_DRONE('SHIP_SIPHON_DRONE'),
  INTERCEPTOR('SHIP_INTERCEPTOR'),
  LIGHT_HAULER('SHIP_LIGHT_HAULER'),
  COMMAND_FRIGATE('SHIP_COMMAND_FRIGATE'),
  EXPLORER('SHIP_EXPLORER'),
  HEAVY_FREIGHTER('SHIP_HEAVY_FREIGHTER'),
  LIGHT_SHUTTLE('SHIP_LIGHT_SHUTTLE'),
  ORE_HOUND('SHIP_ORE_HOUND'),
  REFINING_FREIGHTER('SHIP_REFINING_FREIGHTER'),
  SURVEYOR('SHIP_SURVEYOR'),
  BULK_FREIGHTER('SHIP_BULK_FREIGHTER');

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
