enum ShipRefineRequestProduceInner {
  iron('IRON'),
  copper('COPPER'),
  silver('SILVER'),
  gold('GOLD'),
  aluminum('ALUMINUM'),
  platinum('PLATINUM'),
  uranite('URANITE'),
  meritium('MERITIUM'),
  fuel('FUEL'),
  ;

  const ShipRefineRequestProduceInner(this.value);

  factory ShipRefineRequestProduceInner.fromJson(String json) {
    return ShipRefineRequestProduceInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception(
        'Unknown ShipRefineRequestProduceInner value: $json',
      ),
    );
  }

  final String value;

  String toJson() => value;
}
