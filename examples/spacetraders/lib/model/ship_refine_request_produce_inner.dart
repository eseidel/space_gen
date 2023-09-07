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
    switch (json) {
      case 'IRON':
        return ShipRefineRequestProduceInner.iron;
      case 'COPPER':
        return ShipRefineRequestProduceInner.copper;
      case 'SILVER':
        return ShipRefineRequestProduceInner.silver;
      case 'GOLD':
        return ShipRefineRequestProduceInner.gold;
      case 'ALUMINUM':
        return ShipRefineRequestProduceInner.aluminum;
      case 'PLATINUM':
        return ShipRefineRequestProduceInner.platinum;
      case 'URANITE':
        return ShipRefineRequestProduceInner.uranite;
      case 'MERITIUM':
        return ShipRefineRequestProduceInner.meritium;
      case 'FUEL':
        return ShipRefineRequestProduceInner.fuel;
      default:
        throw Exception('Unknown ShipRefineRequestProduceInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipRefineRequestProduceInner.iron:
        return 'IRON';
      case ShipRefineRequestProduceInner.copper:
        return 'COPPER';
      case ShipRefineRequestProduceInner.silver:
        return 'SILVER';
      case ShipRefineRequestProduceInner.gold:
        return 'GOLD';
      case ShipRefineRequestProduceInner.aluminum:
        return 'ALUMINUM';
      case ShipRefineRequestProduceInner.platinum:
        return 'PLATINUM';
      case ShipRefineRequestProduceInner.uranite:
        return 'URANITE';
      case ShipRefineRequestProduceInner.meritium:
        return 'MERITIUM';
      case ShipRefineRequestProduceInner.fuel:
        return 'FUEL';
    }
  }
}
