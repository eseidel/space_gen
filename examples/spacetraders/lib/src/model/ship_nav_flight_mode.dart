enum ShipNavFlightMode {
  drift('DRIFT'),
  stealth('STEALTH'),
  cruise('CRUISE'),
  burn('BURN'),
  ;

  const ShipNavFlightMode(this.value);

  factory ShipNavFlightMode.fromJson(String json) {
    switch (json) {
      case 'DRIFT':
        return ShipNavFlightMode.drift;
      case 'STEALTH':
        return ShipNavFlightMode.stealth;
      case 'CRUISE':
        return ShipNavFlightMode.cruise;
      case 'BURN':
        return ShipNavFlightMode.burn;
      default:
        throw Exception('Unknown ShipNavFlightMode value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipNavFlightMode.drift:
        return 'DRIFT';
      case ShipNavFlightMode.stealth:
        return 'STEALTH';
      case ShipNavFlightMode.cruise:
        return 'CRUISE';
      case ShipNavFlightMode.burn:
        return 'BURN';
    }
  }
}
