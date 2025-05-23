class ShipRefineRequest {
  ShipRefineRequest({required this.produce});

  factory ShipRefineRequest.fromJson(Map<String, dynamic> json) {
    return ShipRefineRequest(
      produce: ShipRefineRequestProduce.fromJson(json['produce'] as String),
    );
  }

  final ShipRefineRequestProduce produce;

  Map<String, dynamic> toJson() {
    return {'produce': produce.toJson()};
  }
}

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
