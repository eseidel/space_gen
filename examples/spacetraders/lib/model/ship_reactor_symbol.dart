enum ShipReactorSymbol {
  SOLAR_I('REACTOR_SOLAR_I'),
  FUSION_I('REACTOR_FUSION_I'),
  FISSION_I('REACTOR_FISSION_I'),
  CHEMICAL_I('REACTOR_CHEMICAL_I'),
  ANTIMATTER_I('REACTOR_ANTIMATTER_I');

  const ShipReactorSymbol(this.value);

  factory ShipReactorSymbol.fromJson(String json) {
    return ShipReactorSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipReactorSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
