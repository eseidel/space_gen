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
      orElse: () => throw Exception('Unknown ShipReactorSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
