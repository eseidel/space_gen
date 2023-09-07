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
    return ShipRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipRole value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
