enum ShipRole {
  fabricator('FABRICATOR'),
  harvester('HARVESTER'),
  hauler('HAULER'),
  interceptor('INTERCEPTOR'),
  excavator('EXCAVATOR'),
  transport('TRANSPORT'),
  repair('REPAIR'),
  surveyor('SURVEYOR'),
  command('COMMAND'),
  carrier('CARRIER'),
  patrol('PATROL'),
  satellite('SATELLITE'),
  explorer('EXPLORER'),
  refinery('REFINERY'),
  ;

  const ShipRole(this.value);

  factory ShipRole.fromJson(String json) {
    switch (json) {
      case 'FABRICATOR':
        return ShipRole.fabricator;
      case 'HARVESTER':
        return ShipRole.harvester;
      case 'HAULER':
        return ShipRole.hauler;
      case 'INTERCEPTOR':
        return ShipRole.interceptor;
      case 'EXCAVATOR':
        return ShipRole.excavator;
      case 'TRANSPORT':
        return ShipRole.transport;
      case 'REPAIR':
        return ShipRole.repair;
      case 'SURVEYOR':
        return ShipRole.surveyor;
      case 'COMMAND':
        return ShipRole.command;
      case 'CARRIER':
        return ShipRole.carrier;
      case 'PATROL':
        return ShipRole.patrol;
      case 'SATELLITE':
        return ShipRole.satellite;
      case 'EXPLORER':
        return ShipRole.explorer;
      case 'REFINERY':
        return ShipRole.refinery;
      default:
        throw Exception('Unknown ShipRole value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipRole.fabricator:
        return 'FABRICATOR';
      case ShipRole.harvester:
        return 'HARVESTER';
      case ShipRole.hauler:
        return 'HAULER';
      case ShipRole.interceptor:
        return 'INTERCEPTOR';
      case ShipRole.excavator:
        return 'EXCAVATOR';
      case ShipRole.transport:
        return 'TRANSPORT';
      case ShipRole.repair:
        return 'REPAIR';
      case ShipRole.surveyor:
        return 'SURVEYOR';
      case ShipRole.command:
        return 'COMMAND';
      case ShipRole.carrier:
        return 'CARRIER';
      case ShipRole.patrol:
        return 'PATROL';
      case ShipRole.satellite:
        return 'SATELLITE';
      case ShipRole.explorer:
        return 'EXPLORER';
      case ShipRole.refinery:
        return 'REFINERY';
    }
  }
}
