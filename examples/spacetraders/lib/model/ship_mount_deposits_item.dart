enum ShipMountDepositsItem {
  QUARTZ_SAND._('QUARTZ_SAND'),
  SILICON_CRYSTALS._('SILICON_CRYSTALS'),
  PRECIOUS_STONES._('PRECIOUS_STONES'),
  ICE_WATER._('ICE_WATER'),
  AMMONIA_ICE._('AMMONIA_ICE'),
  IRON_ORE._('IRON_ORE'),
  COPPER_ORE._('COPPER_ORE'),
  SILVER_ORE._('SILVER_ORE'),
  ALUMINUM_ORE._('ALUMINUM_ORE'),
  GOLD_ORE._('GOLD_ORE'),
  PLATINUM_ORE._('PLATINUM_ORE'),
  DIAMONDS._('DIAMONDS'),
  URANITE_ORE._('URANITE_ORE'),
  MERITIUM_ORE._('MERITIUM_ORE');

  const ShipMountDepositsItem._(this.value);

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
