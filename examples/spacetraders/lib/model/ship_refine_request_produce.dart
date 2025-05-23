enum ShipRefineRequestProduce {
  IRON('IRON'),
  COPPER('COPPER'),
  SILVER('SILVER'),
  GOLD('GOLD'),
  ALUMINUM('ALUMINUM'),
  PLATINUM('PLATINUM'),
  URANITE('URANITE'),
  MERITIUM('MERITIUM'),
  FUEL('FUEL');

  const ShipRefineRequestProduce(this.value);

  factory ShipRefineRequestProduce.fromJson(String json) {
    return ShipRefineRequestProduce.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () =>
              throw Exception('Unknown ShipRefineRequestProduce value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
