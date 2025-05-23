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
