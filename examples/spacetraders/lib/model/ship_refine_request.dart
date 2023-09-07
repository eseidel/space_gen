class ShipRefineRequest {
  ShipRefineRequest({
    required this.produce,
  });

  factory ShipRefineRequest.fromJson(Map<String, dynamic> json) {
    return ShipRefineRequest(
      produce:
          ShipRefineRequestProduceString.fromJson(json['produce'] as String),
    );
  }

  final ShipRefineRequestProduceString produce;

  Map<String, dynamic> toJson() {
    return {
      'produce': produce.toJson(),
    };
  }
}

enum ShipRefineRequestProduceString {
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

  const ShipRefineRequestProduceString(this.value);

  factory ShipRefineRequestProduceString.fromJson(String json) {
    switch (json) {
      case 'IRON':
        return ShipRefineRequestProduceString.iron;
      case 'COPPER':
        return ShipRefineRequestProduceString.copper;
      case 'SILVER':
        return ShipRefineRequestProduceString.silver;
      case 'GOLD':
        return ShipRefineRequestProduceString.gold;
      case 'ALUMINUM':
        return ShipRefineRequestProduceString.aluminum;
      case 'PLATINUM':
        return ShipRefineRequestProduceString.platinum;
      case 'URANITE':
        return ShipRefineRequestProduceString.uranite;
      case 'MERITIUM':
        return ShipRefineRequestProduceString.meritium;
      case 'FUEL':
        return ShipRefineRequestProduceString.fuel;
      default:
        throw Exception('Unknown ShipRefineRequestProduceString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipRefineRequestProduceString.iron:
        return 'IRON';
      case ShipRefineRequestProduceString.copper:
        return 'COPPER';
      case ShipRefineRequestProduceString.silver:
        return 'SILVER';
      case ShipRefineRequestProduceString.gold:
        return 'GOLD';
      case ShipRefineRequestProduceString.aluminum:
        return 'ALUMINUM';
      case ShipRefineRequestProduceString.platinum:
        return 'PLATINUM';
      case ShipRefineRequestProduceString.uranite:
        return 'URANITE';
      case ShipRefineRequestProduceString.meritium:
        return 'MERITIUM';
      case ShipRefineRequestProduceString.fuel:
        return 'FUEL';
    }
  }
}
