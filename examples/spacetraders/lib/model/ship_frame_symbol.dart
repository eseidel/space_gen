enum ShipFrameSymbol {
  PROBE('FRAME_PROBE'),
  DRONE('FRAME_DRONE'),
  INTERCEPTOR('FRAME_INTERCEPTOR'),
  RACER('FRAME_RACER'),
  FIGHTER('FRAME_FIGHTER'),
  FRIGATE('FRAME_FRIGATE'),
  SHUTTLE('FRAME_SHUTTLE'),
  EXPLORER('FRAME_EXPLORER'),
  MINER('FRAME_MINER'),
  LIGHT_FREIGHTER('FRAME_LIGHT_FREIGHTER'),
  HEAVY_FREIGHTER('FRAME_HEAVY_FREIGHTER'),
  TRANSPORT('FRAME_TRANSPORT'),
  DESTROYER('FRAME_DESTROYER'),
  CRUISER('FRAME_CRUISER'),
  CARRIER('FRAME_CARRIER'),
  BULK_FREIGHTER('FRAME_BULK_FREIGHTER');

  const ShipFrameSymbol(this.value);

  factory ShipFrameSymbol.fromJson(String json) {
    return ShipFrameSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipFrameSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
