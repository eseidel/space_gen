enum ShipRefineRequestProduce {
  IRON._('IRON'),
  COPPER._('COPPER'),
  SILVER._('SILVER'),
  GOLD._('GOLD'),
  ALUMINUM._('ALUMINUM'),
  PLATINUM._('PLATINUM'),
  URANITE._('URANITE'),
  MERITIUM._('MERITIUM'),
  FUEL._('FUEL');

  const ShipRefineRequestProduce._(this.value);

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
