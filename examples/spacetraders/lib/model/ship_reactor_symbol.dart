enum ShipReactorSymbol {
  SOLAR_I._('REACTOR_SOLAR_I'),
  FUSION_I._('REACTOR_FUSION_I'),
  FISSION_I._('REACTOR_FISSION_I'),
  CHEMICAL_I._('REACTOR_CHEMICAL_I'),
  ANTIMATTER_I._('REACTOR_ANTIMATTER_I');

  const ShipReactorSymbol._(this.value);

  factory ShipReactorSymbol.fromJson(String json) {
    return ShipReactorSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () => throw FormatException('Unknown ShipReactorSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipReactorSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipReactorSymbol.fromJson(json);
  }

  final String value;

  String toJson() => value;
}
