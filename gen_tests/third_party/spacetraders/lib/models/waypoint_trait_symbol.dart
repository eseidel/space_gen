/// The unique identifier of the trait.
enum WaypointTraitSymbol {
  uncharted._('UNCHARTED'),
  underConstruction._('UNDER_CONSTRUCTION'),
  marketplace._('MARKETPLACE'),
  shipyard._('SHIPYARD'),
  outpost._('OUTPOST'),
  scatteredSettlements._('SCATTERED_SETTLEMENTS'),
  sprawlingCities._('SPRAWLING_CITIES'),
  megaStructures._('MEGA_STRUCTURES'),
  pirateBase._('PIRATE_BASE'),
  overcrowded._('OVERCROWDED'),
  highTech._('HIGH_TECH'),
  corrupt._('CORRUPT'),
  bureaucratic._('BUREAUCRATIC'),
  tradingHub._('TRADING_HUB'),
  industrial._('INDUSTRIAL'),
  blackMarket._('BLACK_MARKET'),
  researchFacility._('RESEARCH_FACILITY'),
  militaryBase._('MILITARY_BASE'),
  surveillanceOutpost._('SURVEILLANCE_OUTPOST'),
  explorationOutpost._('EXPLORATION_OUTPOST'),
  mineralDeposits._('MINERAL_DEPOSITS'),
  commonMetalDeposits._('COMMON_METAL_DEPOSITS'),
  preciousMetalDeposits._('PRECIOUS_METAL_DEPOSITS'),
  rareMetalDeposits._('RARE_METAL_DEPOSITS'),
  methanePools._('METHANE_POOLS'),
  iceCrystals._('ICE_CRYSTALS'),
  explosiveGases._('EXPLOSIVE_GASES'),
  strongMagnetosphere._('STRONG_MAGNETOSPHERE'),
  vibrantAuroras._('VIBRANT_AURORAS'),
  saltFlats._('SALT_FLATS'),
  canyons._('CANYONS'),
  perpetualDaylight._('PERPETUAL_DAYLIGHT'),
  perpetualOvercast._('PERPETUAL_OVERCAST'),
  drySeabeds._('DRY_SEABEDS'),
  magmaSeas._('MAGMA_SEAS'),
  supervolcanoes._('SUPERVOLCANOES'),
  ashClouds._('ASH_CLOUDS'),
  vastRuins._('VAST_RUINS'),
  mutatedFlora._('MUTATED_FLORA'),
  terraformed._('TERRAFORMED'),
  extremeTemperatures._('EXTREME_TEMPERATURES'),
  extremePressure._('EXTREME_PRESSURE'),
  diverseLife._('DIVERSE_LIFE'),
  scarceLife._('SCARCE_LIFE'),
  fossils._('FOSSILS'),
  weakGravity._('WEAK_GRAVITY'),
  strongGravity._('STRONG_GRAVITY'),
  crushingGravity._('CRUSHING_GRAVITY'),
  toxicAtmosphere._('TOXIC_ATMOSPHERE'),
  corrosiveAtmosphere._('CORROSIVE_ATMOSPHERE'),
  breathableAtmosphere._('BREATHABLE_ATMOSPHERE'),
  thinAtmosphere._('THIN_ATMOSPHERE'),
  jovian._('JOVIAN'),
  rocky._('ROCKY'),
  volcanic._('VOLCANIC'),
  frozen._('FROZEN'),
  swamp._('SWAMP'),
  barren._('BARREN'),
  temperate._('TEMPERATE'),
  jungle._('JUNGLE'),
  ocean._('OCEAN'),
  radioactive._('RADIOACTIVE'),
  microGravityAnomalies._('MICRO_GRAVITY_ANOMALIES'),
  debrisCluster._('DEBRIS_CLUSTER'),
  deepCraters._('DEEP_CRATERS'),
  shallowCraters._('SHALLOW_CRATERS'),
  unstableComposition._('UNSTABLE_COMPOSITION'),
  hollowedInterior._('HOLLOWED_INTERIOR'),
  stripped._('STRIPPED');

  const WaypointTraitSymbol._(this.value);

  /// Creates a WaypointTraitSymbol from a json value.
  factory WaypointTraitSymbol.fromJson(String json) {
    return WaypointTraitSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown WaypointTraitSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static WaypointTraitSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WaypointTraitSymbol.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
