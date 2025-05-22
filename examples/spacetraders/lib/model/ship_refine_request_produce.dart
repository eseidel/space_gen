enum ShipRefineRequestProduce {
  iron('IRON'),
  copper('COPPER'),
  silver('SILVER'),
  gold('GOLD'),
  aluminum('ALUMINUM'),
  platinum('PLATINUM'),
  uranite('URANITE'),
  meritium('MERITIUM'),
  fuel('FUEL');

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
