enum ShipFrameSymbol {
  PROBE._('FRAME_PROBE'),
  DRONE._('FRAME_DRONE'),
  INTERCEPTOR._('FRAME_INTERCEPTOR'),
  RACER._('FRAME_RACER'),
  FIGHTER._('FRAME_FIGHTER'),
  FRIGATE._('FRAME_FRIGATE'),
  SHUTTLE._('FRAME_SHUTTLE'),
  EXPLORER._('FRAME_EXPLORER'),
  MINER._('FRAME_MINER'),
  LIGHT_FREIGHTER._('FRAME_LIGHT_FREIGHTER'),
  HEAVY_FREIGHTER._('FRAME_HEAVY_FREIGHTER'),
  TRANSPORT._('FRAME_TRANSPORT'),
  DESTROYER._('FRAME_DESTROYER'),
  CRUISER._('FRAME_CRUISER'),
  CARRIER._('FRAME_CARRIER'),
  BULK_FREIGHTER._('FRAME_BULK_FREIGHTER');

  const ShipFrameSymbol._(this.value);

  factory ShipFrameSymbol.fromJson(String json) {
    return ShipFrameSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ShipFrameSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipFrameSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipFrameSymbol.fromJson(json);
  }

  final String value;

  String toJson() => value;

  @override
  String toString() => value;
}
