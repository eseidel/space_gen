enum ShipNavStatus {
  inTransit('IN_TRANSIT'),
  inOrbit('IN_ORBIT'),
  docked('DOCKED'),
  ;

  const ShipNavStatus(this.value);

  factory ShipNavStatus.fromJson(String json) {
    switch (json) {
      case 'IN_TRANSIT':
        return ShipNavStatus.inTransit;
      case 'IN_ORBIT':
        return ShipNavStatus.inOrbit;
      case 'DOCKED':
        return ShipNavStatus.docked;
      default:
        throw Exception('Unknown ShipNavStatus value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipNavStatus.inTransit:
        return 'IN_TRANSIT';
      case ShipNavStatus.inOrbit:
        return 'IN_ORBIT';
      case ShipNavStatus.docked:
        return 'DOCKED';
    }
  }
}
