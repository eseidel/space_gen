enum ShipType {
  SHIP_PROBE('SHIP_PROBE'),
  SHIP_MINING_DRONE('SHIP_MINING_DRONE'),
  SHIP_SIPHON_DRONE('SHIP_SIPHON_DRONE'),
  SHIP_INTERCEPTOR('SHIP_INTERCEPTOR'),
  SHIP_LIGHT_HAULER('SHIP_LIGHT_HAULER'),
  SHIP_COMMAND_FRIGATE('SHIP_COMMAND_FRIGATE'),
  SHIP_EXPLORER('SHIP_EXPLORER'),
  SHIP_HEAVY_FREIGHTER('SHIP_HEAVY_FREIGHTER'),
  SHIP_LIGHT_SHUTTLE('SHIP_LIGHT_SHUTTLE'),
  SHIP_ORE_HOUND('SHIP_ORE_HOUND'),
  SHIP_REFINING_FREIGHTER('SHIP_REFINING_FREIGHTER'),
  SHIP_SURVEYOR('SHIP_SURVEYOR'),
  SHIP_BULK_FREIGHTER('SHIP_BULK_FREIGHTER');

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
