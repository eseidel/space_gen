/// The symbol of the engine.
enum ShipEngineSymbol {
  engineImpulseDriveI._('ENGINE_IMPULSE_DRIVE_I'),
  engineIonDriveI._('ENGINE_ION_DRIVE_I'),
  engineIonDriveIi._('ENGINE_ION_DRIVE_II'),
  engineHyperDriveI._('ENGINE_HYPER_DRIVE_I');

  const ShipEngineSymbol._(this.value);

  /// Creates a ShipEngineSymbol from a json value.
  factory ShipEngineSymbol.fromJson(String json) {
    return ShipEngineSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ShipEngineSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipEngineSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipEngineSymbol.fromJson(json);
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
