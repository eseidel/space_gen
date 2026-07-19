/// Symbol of the frame.
enum ShipFrameSymbol {
  frameProbe._('FRAME_PROBE'),
  frameDrone._('FRAME_DRONE'),
  frameInterceptor._('FRAME_INTERCEPTOR'),
  frameRacer._('FRAME_RACER'),
  frameFighter._('FRAME_FIGHTER'),
  frameFrigate._('FRAME_FRIGATE'),
  frameShuttle._('FRAME_SHUTTLE'),
  frameExplorer._('FRAME_EXPLORER'),
  frameMiner._('FRAME_MINER'),
  frameLightFreighter._('FRAME_LIGHT_FREIGHTER'),
  frameHeavyFreighter._('FRAME_HEAVY_FREIGHTER'),
  frameTransport._('FRAME_TRANSPORT'),
  frameDestroyer._('FRAME_DESTROYER'),
  frameCruiser._('FRAME_CRUISER'),
  frameCarrier._('FRAME_CARRIER'),
  frameBulkFreighter._('FRAME_BULK_FREIGHTER');

  const ShipFrameSymbol._(this.value);

  /// Creates a ShipFrameSymbol from a json value.
  factory ShipFrameSymbol.fromJson(String json) {
    return ShipFrameSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ShipFrameSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipFrameSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipFrameSymbol.fromJson(json);
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
