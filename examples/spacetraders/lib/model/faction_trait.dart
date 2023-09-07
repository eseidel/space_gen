class FactionTrait {
  FactionTrait({
    required this.symbol,
    required this.name,
    required this.description,
  });

  factory FactionTrait.fromJson(Map<String, dynamic> json) {
    return FactionTrait(
      symbol: FactionTraitSymbolInner.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  final FactionTraitSymbolInner symbol;
  final String name;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
    };
  }
}

enum FactionTraitSymbolInner {
  bureaucratic('BUREAUCRATIC'),
  secretive('SECRETIVE'),
  capitalistic('CAPITALISTIC'),
  industrious('INDUSTRIOUS'),
  peaceful('PEACEFUL'),
  distrustful('DISTRUSTFUL'),
  welcoming('WELCOMING'),
  smugglers('SMUGGLERS'),
  scavengers('SCAVENGERS'),
  rebellious('REBELLIOUS'),
  exiles('EXILES'),
  pirates('PIRATES'),
  raiders('RAIDERS'),
  clan('CLAN'),
  guild('GUILD'),
  dominion('DOMINION'),
  fringe('FRINGE'),
  forsaken('FORSAKEN'),
  isolated('ISOLATED'),
  localized('LOCALIZED'),
  established('ESTABLISHED'),
  notable('NOTABLE'),
  dominant('DOMINANT'),
  inescapable('INESCAPABLE'),
  innovative('INNOVATIVE'),
  bold('BOLD'),
  visionary('VISIONARY'),
  curious('CURIOUS'),
  daring('DARING'),
  exploratory('EXPLORATORY'),
  resourceful('RESOURCEFUL'),
  flexible('FLEXIBLE'),
  cooperative('COOPERATIVE'),
  united('UNITED'),
  strategic('STRATEGIC'),
  intelligent('INTELLIGENT'),
  researchFocused('RESEARCH_FOCUSED'),
  collaborative('COLLABORATIVE'),
  progressive('PROGRESSIVE'),
  militaristic('MILITARISTIC'),
  technologicallyAdvanced('TECHNOLOGICALLY_ADVANCED'),
  aggressive('AGGRESSIVE'),
  imperialistic('IMPERIALISTIC'),
  treasureHunters('TREASURE_HUNTERS'),
  dexterous('DEXTEROUS'),
  unpredictable('UNPREDICTABLE'),
  brutal('BRUTAL'),
  fleeting('FLEETING'),
  adaptable('ADAPTABLE'),
  selfSufficient('SELF_SUFFICIENT'),
  defensive('DEFENSIVE'),
  proud('PROUD'),
  diverse('DIVERSE'),
  independent('INDEPENDENT'),
  selfInterested('SELF_INTERESTED'),
  fragmented('FRAGMENTED'),
  commercial('COMMERCIAL'),
  freeMarkets('FREE_MARKETS'),
  entrepreneurial('ENTREPRENEURIAL'),
  ;

  const FactionTraitSymbolInner(this.value);

  factory FactionTraitSymbolInner.fromJson(String json) {
    return FactionTraitSymbolInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw Exception('Unknown FactionTraitSymbolInner value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
