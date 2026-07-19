/// Symbol of the reactor.
enum ShipReactorSymbol {
  reactorSolarI._('REACTOR_SOLAR_I'),
  reactorFusionI._('REACTOR_FUSION_I'),
  reactorFissionI._('REACTOR_FISSION_I'),
  reactorChemicalI._('REACTOR_CHEMICAL_I'),
  reactorAntimatterI._('REACTOR_ANTIMATTER_I');

  const ShipReactorSymbol._(this.value);

  /// Creates a ShipReactorSymbol from a json value.
  factory ShipReactorSymbol.fromJson(String json) {
    return ShipReactorSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ShipReactorSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipReactorSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipReactorSymbol.fromJson(json);
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
