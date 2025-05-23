import 'package:spacetraders/model/ship_requirements.dart';

class ShipMount {
  ShipMount({
    required this.symbol,
    required this.name,
    required this.description,
    required this.strength,
    required this.deposits,
    required this.requirements,
  });

  factory ShipMount.fromJson(Map<String, dynamic> json) {
    return ShipMount(
      symbol: ShipMountSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      strength: json['strength'] as int,
      deposits:
          (json['deposits'] as List<dynamic>).cast<ShipMountDepositsItem>(),
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipMountSymbol symbol;
  final String name;
  final String description;
  final int strength;
  final List<ShipMountDepositsItem> deposits;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'strength': strength,
      'deposits': deposits,
      'requirements': requirements.toJson(),
    };
  }
}

enum ShipMountSymbol {
  MOUNT_GAS_SIPHON_I('MOUNT_GAS_SIPHON_I'),
  MOUNT_GAS_SIPHON_II('MOUNT_GAS_SIPHON_II'),
  MOUNT_GAS_SIPHON_III('MOUNT_GAS_SIPHON_III'),
  MOUNT_SURVEYOR_I('MOUNT_SURVEYOR_I'),
  MOUNT_SURVEYOR_II('MOUNT_SURVEYOR_II'),
  MOUNT_SURVEYOR_III('MOUNT_SURVEYOR_III'),
  MOUNT_SENSOR_ARRAY_I('MOUNT_SENSOR_ARRAY_I'),
  MOUNT_SENSOR_ARRAY_II('MOUNT_SENSOR_ARRAY_II'),
  MOUNT_SENSOR_ARRAY_III('MOUNT_SENSOR_ARRAY_III'),
  MOUNT_MINING_LASER_I('MOUNT_MINING_LASER_I'),
  MOUNT_MINING_LASER_II('MOUNT_MINING_LASER_II'),
  MOUNT_MINING_LASER_III('MOUNT_MINING_LASER_III'),
  MOUNT_LASER_CANNON_I('MOUNT_LASER_CANNON_I'),
  MOUNT_MISSILE_LAUNCHER_I('MOUNT_MISSILE_LAUNCHER_I'),
  MOUNT_TURRET_I('MOUNT_TURRET_I');

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

enum ShipMountDepositsItem {
  QUARTZ_SAND('QUARTZ_SAND'),
  SILICON_CRYSTALS('SILICON_CRYSTALS'),
  PRECIOUS_STONES('PRECIOUS_STONES'),
  ICE_WATER('ICE_WATER'),
  AMMONIA_ICE('AMMONIA_ICE'),
  IRON_ORE('IRON_ORE'),
  COPPER_ORE('COPPER_ORE'),
  SILVER_ORE('SILVER_ORE'),
  ALUMINUM_ORE('ALUMINUM_ORE'),
  GOLD_ORE('GOLD_ORE'),
  PLATINUM_ORE('PLATINUM_ORE'),
  DIAMONDS('DIAMONDS'),
  URANITE_ORE('URANITE_ORE'),
  MERITIUM_ORE('MERITIUM_ORE');

  const ShipMountDepositsItem(this.value);

  factory ShipMountDepositsItem.fromJson(String json) {
    return ShipMountDepositsItem.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () => throw Exception('Unknown ShipMountDepositsItem value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
