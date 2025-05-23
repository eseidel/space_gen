enum ShipRole {
  FABRICATOR('FABRICATOR'),
  HARVESTER('HARVESTER'),
  HAULER('HAULER'),
  INTERCEPTOR('INTERCEPTOR'),
  EXCAVATOR('EXCAVATOR'),
  TRANSPORT('TRANSPORT'),
  REPAIR('REPAIR'),
  SURVEYOR('SURVEYOR'),
  COMMAND('COMMAND'),
  CARRIER('CARRIER'),
  PATROL('PATROL'),
  SATELLITE('SATELLITE'),
  EXPLORER('EXPLORER'),
  REFINERY('REFINERY');

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
