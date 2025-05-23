enum ShipEngineSymbol {
  IMPULSE_DRIVE_I('ENGINE_IMPULSE_DRIVE_I'),
  ION_DRIVE_I('ENGINE_ION_DRIVE_I'),
  ION_DRIVE_II('ENGINE_ION_DRIVE_II'),
  HYPER_DRIVE_I('ENGINE_HYPER_DRIVE_I');

  const ShipEngineSymbol(this.value);

  factory ShipEngineSymbol.fromJson(String json) {
    return ShipEngineSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipEngineSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
