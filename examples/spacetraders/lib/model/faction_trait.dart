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
    switch (json) {
      case 'BUREAUCRATIC':
        return FactionTraitSymbolInner.bureaucratic;
      case 'SECRETIVE':
        return FactionTraitSymbolInner.secretive;
      case 'CAPITALISTIC':
        return FactionTraitSymbolInner.capitalistic;
      case 'INDUSTRIOUS':
        return FactionTraitSymbolInner.industrious;
      case 'PEACEFUL':
        return FactionTraitSymbolInner.peaceful;
      case 'DISTRUSTFUL':
        return FactionTraitSymbolInner.distrustful;
      case 'WELCOMING':
        return FactionTraitSymbolInner.welcoming;
      case 'SMUGGLERS':
        return FactionTraitSymbolInner.smugglers;
      case 'SCAVENGERS':
        return FactionTraitSymbolInner.scavengers;
      case 'REBELLIOUS':
        return FactionTraitSymbolInner.rebellious;
      case 'EXILES':
        return FactionTraitSymbolInner.exiles;
      case 'PIRATES':
        return FactionTraitSymbolInner.pirates;
      case 'RAIDERS':
        return FactionTraitSymbolInner.raiders;
      case 'CLAN':
        return FactionTraitSymbolInner.clan;
      case 'GUILD':
        return FactionTraitSymbolInner.guild;
      case 'DOMINION':
        return FactionTraitSymbolInner.dominion;
      case 'FRINGE':
        return FactionTraitSymbolInner.fringe;
      case 'FORSAKEN':
        return FactionTraitSymbolInner.forsaken;
      case 'ISOLATED':
        return FactionTraitSymbolInner.isolated;
      case 'LOCALIZED':
        return FactionTraitSymbolInner.localized;
      case 'ESTABLISHED':
        return FactionTraitSymbolInner.established;
      case 'NOTABLE':
        return FactionTraitSymbolInner.notable;
      case 'DOMINANT':
        return FactionTraitSymbolInner.dominant;
      case 'INESCAPABLE':
        return FactionTraitSymbolInner.inescapable;
      case 'INNOVATIVE':
        return FactionTraitSymbolInner.innovative;
      case 'BOLD':
        return FactionTraitSymbolInner.bold;
      case 'VISIONARY':
        return FactionTraitSymbolInner.visionary;
      case 'CURIOUS':
        return FactionTraitSymbolInner.curious;
      case 'DARING':
        return FactionTraitSymbolInner.daring;
      case 'EXPLORATORY':
        return FactionTraitSymbolInner.exploratory;
      case 'RESOURCEFUL':
        return FactionTraitSymbolInner.resourceful;
      case 'FLEXIBLE':
        return FactionTraitSymbolInner.flexible;
      case 'COOPERATIVE':
        return FactionTraitSymbolInner.cooperative;
      case 'UNITED':
        return FactionTraitSymbolInner.united;
      case 'STRATEGIC':
        return FactionTraitSymbolInner.strategic;
      case 'INTELLIGENT':
        return FactionTraitSymbolInner.intelligent;
      case 'RESEARCH_FOCUSED':
        return FactionTraitSymbolInner.researchFocused;
      case 'COLLABORATIVE':
        return FactionTraitSymbolInner.collaborative;
      case 'PROGRESSIVE':
        return FactionTraitSymbolInner.progressive;
      case 'MILITARISTIC':
        return FactionTraitSymbolInner.militaristic;
      case 'TECHNOLOGICALLY_ADVANCED':
        return FactionTraitSymbolInner.technologicallyAdvanced;
      case 'AGGRESSIVE':
        return FactionTraitSymbolInner.aggressive;
      case 'IMPERIALISTIC':
        return FactionTraitSymbolInner.imperialistic;
      case 'TREASURE_HUNTERS':
        return FactionTraitSymbolInner.treasureHunters;
      case 'DEXTEROUS':
        return FactionTraitSymbolInner.dexterous;
      case 'UNPREDICTABLE':
        return FactionTraitSymbolInner.unpredictable;
      case 'BRUTAL':
        return FactionTraitSymbolInner.brutal;
      case 'FLEETING':
        return FactionTraitSymbolInner.fleeting;
      case 'ADAPTABLE':
        return FactionTraitSymbolInner.adaptable;
      case 'SELF_SUFFICIENT':
        return FactionTraitSymbolInner.selfSufficient;
      case 'DEFENSIVE':
        return FactionTraitSymbolInner.defensive;
      case 'PROUD':
        return FactionTraitSymbolInner.proud;
      case 'DIVERSE':
        return FactionTraitSymbolInner.diverse;
      case 'INDEPENDENT':
        return FactionTraitSymbolInner.independent;
      case 'SELF_INTERESTED':
        return FactionTraitSymbolInner.selfInterested;
      case 'FRAGMENTED':
        return FactionTraitSymbolInner.fragmented;
      case 'COMMERCIAL':
        return FactionTraitSymbolInner.commercial;
      case 'FREE_MARKETS':
        return FactionTraitSymbolInner.freeMarkets;
      case 'ENTREPRENEURIAL':
        return FactionTraitSymbolInner.entrepreneurial;
      default:
        throw Exception('Unknown FactionTraitSymbolInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case FactionTraitSymbolInner.bureaucratic:
        return 'BUREAUCRATIC';
      case FactionTraitSymbolInner.secretive:
        return 'SECRETIVE';
      case FactionTraitSymbolInner.capitalistic:
        return 'CAPITALISTIC';
      case FactionTraitSymbolInner.industrious:
        return 'INDUSTRIOUS';
      case FactionTraitSymbolInner.peaceful:
        return 'PEACEFUL';
      case FactionTraitSymbolInner.distrustful:
        return 'DISTRUSTFUL';
      case FactionTraitSymbolInner.welcoming:
        return 'WELCOMING';
      case FactionTraitSymbolInner.smugglers:
        return 'SMUGGLERS';
      case FactionTraitSymbolInner.scavengers:
        return 'SCAVENGERS';
      case FactionTraitSymbolInner.rebellious:
        return 'REBELLIOUS';
      case FactionTraitSymbolInner.exiles:
        return 'EXILES';
      case FactionTraitSymbolInner.pirates:
        return 'PIRATES';
      case FactionTraitSymbolInner.raiders:
        return 'RAIDERS';
      case FactionTraitSymbolInner.clan:
        return 'CLAN';
      case FactionTraitSymbolInner.guild:
        return 'GUILD';
      case FactionTraitSymbolInner.dominion:
        return 'DOMINION';
      case FactionTraitSymbolInner.fringe:
        return 'FRINGE';
      case FactionTraitSymbolInner.forsaken:
        return 'FORSAKEN';
      case FactionTraitSymbolInner.isolated:
        return 'ISOLATED';
      case FactionTraitSymbolInner.localized:
        return 'LOCALIZED';
      case FactionTraitSymbolInner.established:
        return 'ESTABLISHED';
      case FactionTraitSymbolInner.notable:
        return 'NOTABLE';
      case FactionTraitSymbolInner.dominant:
        return 'DOMINANT';
      case FactionTraitSymbolInner.inescapable:
        return 'INESCAPABLE';
      case FactionTraitSymbolInner.innovative:
        return 'INNOVATIVE';
      case FactionTraitSymbolInner.bold:
        return 'BOLD';
      case FactionTraitSymbolInner.visionary:
        return 'VISIONARY';
      case FactionTraitSymbolInner.curious:
        return 'CURIOUS';
      case FactionTraitSymbolInner.daring:
        return 'DARING';
      case FactionTraitSymbolInner.exploratory:
        return 'EXPLORATORY';
      case FactionTraitSymbolInner.resourceful:
        return 'RESOURCEFUL';
      case FactionTraitSymbolInner.flexible:
        return 'FLEXIBLE';
      case FactionTraitSymbolInner.cooperative:
        return 'COOPERATIVE';
      case FactionTraitSymbolInner.united:
        return 'UNITED';
      case FactionTraitSymbolInner.strategic:
        return 'STRATEGIC';
      case FactionTraitSymbolInner.intelligent:
        return 'INTELLIGENT';
      case FactionTraitSymbolInner.researchFocused:
        return 'RESEARCH_FOCUSED';
      case FactionTraitSymbolInner.collaborative:
        return 'COLLABORATIVE';
      case FactionTraitSymbolInner.progressive:
        return 'PROGRESSIVE';
      case FactionTraitSymbolInner.militaristic:
        return 'MILITARISTIC';
      case FactionTraitSymbolInner.technologicallyAdvanced:
        return 'TECHNOLOGICALLY_ADVANCED';
      case FactionTraitSymbolInner.aggressive:
        return 'AGGRESSIVE';
      case FactionTraitSymbolInner.imperialistic:
        return 'IMPERIALISTIC';
      case FactionTraitSymbolInner.treasureHunters:
        return 'TREASURE_HUNTERS';
      case FactionTraitSymbolInner.dexterous:
        return 'DEXTEROUS';
      case FactionTraitSymbolInner.unpredictable:
        return 'UNPREDICTABLE';
      case FactionTraitSymbolInner.brutal:
        return 'BRUTAL';
      case FactionTraitSymbolInner.fleeting:
        return 'FLEETING';
      case FactionTraitSymbolInner.adaptable:
        return 'ADAPTABLE';
      case FactionTraitSymbolInner.selfSufficient:
        return 'SELF_SUFFICIENT';
      case FactionTraitSymbolInner.defensive:
        return 'DEFENSIVE';
      case FactionTraitSymbolInner.proud:
        return 'PROUD';
      case FactionTraitSymbolInner.diverse:
        return 'DIVERSE';
      case FactionTraitSymbolInner.independent:
        return 'INDEPENDENT';
      case FactionTraitSymbolInner.selfInterested:
        return 'SELF_INTERESTED';
      case FactionTraitSymbolInner.fragmented:
        return 'FRAGMENTED';
      case FactionTraitSymbolInner.commercial:
        return 'COMMERCIAL';
      case FactionTraitSymbolInner.freeMarkets:
        return 'FREE_MARKETS';
      case FactionTraitSymbolInner.entrepreneurial:
        return 'ENTREPRENEURIAL';
    }
  }
}
