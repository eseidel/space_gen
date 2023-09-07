class ShipRefineRequest {
  ShipRefineRequest({
    required this.produce,
  });

  factory ShipRefineRequest.fromJson(Map<String, dynamic> json) {
    return ShipRefineRequest(
      produce:
          ShipRefineRequestProduceInner.fromJson(json['produce'] as String),
    );
  }

  final ShipRefineRequestProduceInner produce;

  Map<String, dynamic> toJson() {
    return {
      'produce': produce.toJson(),
    };
  }
}

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
