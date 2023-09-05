enum ShipType {
  shipProbe('SHIP_PROBE'),
  shipMiningDrone('SHIP_MINING_DRONE'),
  shipInterceptor('SHIP_INTERCEPTOR'),
  shipLightHauler('SHIP_LIGHT_HAULER'),
  shipCommandFrigate('SHIP_COMMAND_FRIGATE'),
  shipExplorer('SHIP_EXPLORER'),
  shipHeavyFreighter('SHIP_HEAVY_FREIGHTER'),
  shipLightShuttle('SHIP_LIGHT_SHUTTLE'),
  shipOreHound('SHIP_ORE_HOUND'),
  shipRefiningFreighter('SHIP_REFINING_FREIGHTER'),
  ;

  const ShipType(this.value);

  factory ShipType.fromJson(String json) {
    switch (json) {
      case 'SHIP_PROBE':
        return ShipType.shipProbe;
      case 'SHIP_MINING_DRONE':
        return ShipType.shipMiningDrone;
      case 'SHIP_INTERCEPTOR':
        return ShipType.shipInterceptor;
      case 'SHIP_LIGHT_HAULER':
        return ShipType.shipLightHauler;
      case 'SHIP_COMMAND_FRIGATE':
        return ShipType.shipCommandFrigate;
      case 'SHIP_EXPLORER':
        return ShipType.shipExplorer;
      case 'SHIP_HEAVY_FREIGHTER':
        return ShipType.shipHeavyFreighter;
      case 'SHIP_LIGHT_SHUTTLE':
        return ShipType.shipLightShuttle;
      case 'SHIP_ORE_HOUND':
        return ShipType.shipOreHound;
      case 'SHIP_REFINING_FREIGHTER':
        return ShipType.shipRefiningFreighter;
      default:
        throw Exception('Unknown ShipType value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipType.shipProbe:
        return 'SHIP_PROBE';
      case ShipType.shipMiningDrone:
        return 'SHIP_MINING_DRONE';
      case ShipType.shipInterceptor:
        return 'SHIP_INTERCEPTOR';
      case ShipType.shipLightHauler:
        return 'SHIP_LIGHT_HAULER';
      case ShipType.shipCommandFrigate:
        return 'SHIP_COMMAND_FRIGATE';
      case ShipType.shipExplorer:
        return 'SHIP_EXPLORER';
      case ShipType.shipHeavyFreighter:
        return 'SHIP_HEAVY_FREIGHTER';
      case ShipType.shipLightShuttle:
        return 'SHIP_LIGHT_SHUTTLE';
      case ShipType.shipOreHound:
        return 'SHIP_ORE_HOUND';
      case ShipType.shipRefiningFreighter:
        return 'SHIP_REFINING_FREIGHTER';
    }
  }
}
