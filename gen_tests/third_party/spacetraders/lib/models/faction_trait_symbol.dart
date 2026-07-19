/// The unique identifier of the trait.
enum FactionTraitSymbol {
  bureaucratic._('BUREAUCRATIC'),
  secretive._('SECRETIVE'),
  capitalistic._('CAPITALISTIC'),
  industrious._('INDUSTRIOUS'),
  peaceful._('PEACEFUL'),
  distrustful._('DISTRUSTFUL'),
  welcoming._('WELCOMING'),
  smugglers._('SMUGGLERS'),
  scavengers._('SCAVENGERS'),
  rebellious._('REBELLIOUS'),
  exiles._('EXILES'),
  pirates._('PIRATES'),
  raiders._('RAIDERS'),
  clan._('CLAN'),
  guild._('GUILD'),
  dominion._('DOMINION'),
  fringe._('FRINGE'),
  forsaken._('FORSAKEN'),
  isolated._('ISOLATED'),
  localized._('LOCALIZED'),
  established._('ESTABLISHED'),
  notable._('NOTABLE'),
  dominant._('DOMINANT'),
  inescapable._('INESCAPABLE'),
  innovative._('INNOVATIVE'),
  bold._('BOLD'),
  visionary._('VISIONARY'),
  curious._('CURIOUS'),
  daring._('DARING'),
  exploratory._('EXPLORATORY'),
  resourceful._('RESOURCEFUL'),
  flexible._('FLEXIBLE'),
  cooperative._('COOPERATIVE'),
  united._('UNITED'),
  strategic._('STRATEGIC'),
  intelligent._('INTELLIGENT'),
  researchFocused._('RESEARCH_FOCUSED'),
  collaborative._('COLLABORATIVE'),
  progressive._('PROGRESSIVE'),
  militaristic._('MILITARISTIC'),
  technologicallyAdvanced._('TECHNOLOGICALLY_ADVANCED'),
  aggressive._('AGGRESSIVE'),
  imperialistic._('IMPERIALISTIC'),
  treasureHunters._('TREASURE_HUNTERS'),
  dexterous._('DEXTEROUS'),
  unpredictable._('UNPREDICTABLE'),
  brutal._('BRUTAL'),
  fleeting._('FLEETING'),
  adaptable._('ADAPTABLE'),
  selfSufficient._('SELF_SUFFICIENT'),
  defensive._('DEFENSIVE'),
  proud._('PROUD'),
  diverse._('DIVERSE'),
  independent._('INDEPENDENT'),
  selfInterested._('SELF_INTERESTED'),
  fragmented._('FRAGMENTED'),
  commercial._('COMMERCIAL'),
  freeMarkets._('FREE_MARKETS'),
  entrepreneurial._('ENTREPRENEURIAL');

  const FactionTraitSymbol._(this.value);

  /// Creates a FactionTraitSymbol from a json value.
  factory FactionTraitSymbol.fromJson(String json) {
    return FactionTraitSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown FactionTraitSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static FactionTraitSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return FactionTraitSymbol.fromJson(json);
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
