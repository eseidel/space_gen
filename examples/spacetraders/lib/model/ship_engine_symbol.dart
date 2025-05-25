enum ShipEngineSymbol {
  IMPULSE_DRIVE_I._('ENGINE_IMPULSE_DRIVE_I'),
  ION_DRIVE_I._('ENGINE_ION_DRIVE_I'),
  ION_DRIVE_II._('ENGINE_ION_DRIVE_II'),
  HYPER_DRIVE_I._('ENGINE_HYPER_DRIVE_I');

  const ShipEngineSymbol._(this.value);

  factory ShipEngineSymbol.fromJson(String json) {
    return ShipEngineSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () => throw FormatException('Unknown ShipEngineSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipEngineSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipEngineSymbol.fromJson(json);
  }

  final String value;

  String toJson() => value;

  @override
  String toString() => value;
}
