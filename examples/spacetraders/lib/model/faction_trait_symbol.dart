enum FactionTraitSymbol {
  BUREAUCRATIC._('BUREAUCRATIC'),
  SECRETIVE._('SECRETIVE'),
  CAPITALISTIC._('CAPITALISTIC'),
  INDUSTRIOUS._('INDUSTRIOUS'),
  PEACEFUL._('PEACEFUL'),
  DISTRUSTFUL._('DISTRUSTFUL'),
  WELCOMING._('WELCOMING'),
  SMUGGLERS._('SMUGGLERS'),
  SCAVENGERS._('SCAVENGERS'),
  REBELLIOUS._('REBELLIOUS'),
  EXILES._('EXILES'),
  PIRATES._('PIRATES'),
  RAIDERS._('RAIDERS'),
  CLAN._('CLAN'),
  GUILD._('GUILD'),
  DOMINION._('DOMINION'),
  FRINGE._('FRINGE'),
  FORSAKEN._('FORSAKEN'),
  ISOLATED._('ISOLATED'),
  LOCALIZED._('LOCALIZED'),
  ESTABLISHED._('ESTABLISHED'),
  NOTABLE._('NOTABLE'),
  DOMINANT._('DOMINANT'),
  INESCAPABLE._('INESCAPABLE'),
  INNOVATIVE._('INNOVATIVE'),
  BOLD._('BOLD'),
  VISIONARY._('VISIONARY'),
  CURIOUS._('CURIOUS'),
  DARING._('DARING'),
  EXPLORATORY._('EXPLORATORY'),
  RESOURCEFUL._('RESOURCEFUL'),
  FLEXIBLE._('FLEXIBLE'),
  COOPERATIVE._('COOPERATIVE'),
  UNITED._('UNITED'),
  STRATEGIC._('STRATEGIC'),
  INTELLIGENT._('INTELLIGENT'),
  RESEARCH_FOCUSED._('RESEARCH_FOCUSED'),
  COLLABORATIVE._('COLLABORATIVE'),
  PROGRESSIVE._('PROGRESSIVE'),
  MILITARISTIC._('MILITARISTIC'),
  TECHNOLOGICALLY_ADVANCED._('TECHNOLOGICALLY_ADVANCED'),
  AGGRESSIVE._('AGGRESSIVE'),
  IMPERIALISTIC._('IMPERIALISTIC'),
  TREASURE_HUNTERS._('TREASURE_HUNTERS'),
  DEXTEROUS._('DEXTEROUS'),
  UNPREDICTABLE._('UNPREDICTABLE'),
  BRUTAL._('BRUTAL'),
  FLEETING._('FLEETING'),
  ADAPTABLE._('ADAPTABLE'),
  SELF_SUFFICIENT._('SELF_SUFFICIENT'),
  DEFENSIVE._('DEFENSIVE'),
  PROUD._('PROUD'),
  DIVERSE._('DIVERSE'),
  INDEPENDENT._('INDEPENDENT'),
  SELF_INTERESTED._('SELF_INTERESTED'),
  FRAGMENTED._('FRAGMENTED'),
  COMMERCIAL._('COMMERCIAL'),
  FREE_MARKETS._('FREE_MARKETS'),
  ENTREPRENEURIAL._('ENTREPRENEURIAL');

  const FactionTraitSymbol._(this.value);

  factory FactionTraitSymbol.fromJson(String json) {
    return FactionTraitSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () =>
              throw FormatException('Unknown FactionTraitSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FactionTraitSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return FactionTraitSymbol.fromJson(json);
  }

  final String value;

  String toJson() => value;

  @override
  String toString() => value;
}
