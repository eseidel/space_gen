enum ShipMountSymbol {
  GAS_SIPHON_I('MOUNT_GAS_SIPHON_I'),
  GAS_SIPHON_II('MOUNT_GAS_SIPHON_II'),
  GAS_SIPHON_III('MOUNT_GAS_SIPHON_III'),
  SURVEYOR_I('MOUNT_SURVEYOR_I'),
  SURVEYOR_II('MOUNT_SURVEYOR_II'),
  SURVEYOR_III('MOUNT_SURVEYOR_III'),
  SENSOR_ARRAY_I('MOUNT_SENSOR_ARRAY_I'),
  SENSOR_ARRAY_II('MOUNT_SENSOR_ARRAY_II'),
  SENSOR_ARRAY_III('MOUNT_SENSOR_ARRAY_III'),
  MINING_LASER_I('MOUNT_MINING_LASER_I'),
  MINING_LASER_II('MOUNT_MINING_LASER_II'),
  MINING_LASER_III('MOUNT_MINING_LASER_III'),
  LASER_CANNON_I('MOUNT_LASER_CANNON_I'),
  MISSILE_LAUNCHER_I('MOUNT_MISSILE_LAUNCHER_I'),
  TURRET_I('MOUNT_TURRET_I');

  const ShipMountSymbol(this.value);

  factory ShipMountSymbol.fromJson(String json) {
    return ShipMountSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipMountSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
