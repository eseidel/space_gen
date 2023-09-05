class FactionTrait {
  FactionTrait({
    required this.symbol,
    required this.name,
    required this.description,
  });

  factory FactionTrait.fromJson(Map<String, dynamic> json) {
    return FactionTrait(
      symbol: FactionTraitSymbolString.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  final FactionTraitSymbolString symbol;
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

enum FactionTraitSymbolString {
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

  const FactionTraitSymbolString(this.value);

  factory FactionTraitSymbolString.fromJson(String json) {
    switch (json) {
      case 'BUREAUCRATIC':
        return FactionTraitSymbolString.bureaucratic;
      case 'SECRETIVE':
        return FactionTraitSymbolString.secretive;
      case 'CAPITALISTIC':
        return FactionTraitSymbolString.capitalistic;
      case 'INDUSTRIOUS':
        return FactionTraitSymbolString.industrious;
      case 'PEACEFUL':
        return FactionTraitSymbolString.peaceful;
      case 'DISTRUSTFUL':
        return FactionTraitSymbolString.distrustful;
      case 'WELCOMING':
        return FactionTraitSymbolString.welcoming;
      case 'SMUGGLERS':
        return FactionTraitSymbolString.smugglers;
      case 'SCAVENGERS':
        return FactionTraitSymbolString.scavengers;
      case 'REBELLIOUS':
        return FactionTraitSymbolString.rebellious;
      case 'EXILES':
        return FactionTraitSymbolString.exiles;
      case 'PIRATES':
        return FactionTraitSymbolString.pirates;
      case 'RAIDERS':
        return FactionTraitSymbolString.raiders;
      case 'CLAN':
        return FactionTraitSymbolString.clan;
      case 'GUILD':
        return FactionTraitSymbolString.guild;
      case 'DOMINION':
        return FactionTraitSymbolString.dominion;
      case 'FRINGE':
        return FactionTraitSymbolString.fringe;
      case 'FORSAKEN':
        return FactionTraitSymbolString.forsaken;
      case 'ISOLATED':
        return FactionTraitSymbolString.isolated;
      case 'LOCALIZED':
        return FactionTraitSymbolString.localized;
      case 'ESTABLISHED':
        return FactionTraitSymbolString.established;
      case 'NOTABLE':
        return FactionTraitSymbolString.notable;
      case 'DOMINANT':
        return FactionTraitSymbolString.dominant;
      case 'INESCAPABLE':
        return FactionTraitSymbolString.inescapable;
      case 'INNOVATIVE':
        return FactionTraitSymbolString.innovative;
      case 'BOLD':
        return FactionTraitSymbolString.bold;
      case 'VISIONARY':
        return FactionTraitSymbolString.visionary;
      case 'CURIOUS':
        return FactionTraitSymbolString.curious;
      case 'DARING':
        return FactionTraitSymbolString.daring;
      case 'EXPLORATORY':
        return FactionTraitSymbolString.exploratory;
      case 'RESOURCEFUL':
        return FactionTraitSymbolString.resourceful;
      case 'FLEXIBLE':
        return FactionTraitSymbolString.flexible;
      case 'COOPERATIVE':
        return FactionTraitSymbolString.cooperative;
      case 'UNITED':
        return FactionTraitSymbolString.united;
      case 'STRATEGIC':
        return FactionTraitSymbolString.strategic;
      case 'INTELLIGENT':
        return FactionTraitSymbolString.intelligent;
      case 'RESEARCH_FOCUSED':
        return FactionTraitSymbolString.researchFocused;
      case 'COLLABORATIVE':
        return FactionTraitSymbolString.collaborative;
      case 'PROGRESSIVE':
        return FactionTraitSymbolString.progressive;
      case 'MILITARISTIC':
        return FactionTraitSymbolString.militaristic;
      case 'TECHNOLOGICALLY_ADVANCED':
        return FactionTraitSymbolString.technologicallyAdvanced;
      case 'AGGRESSIVE':
        return FactionTraitSymbolString.aggressive;
      case 'IMPERIALISTIC':
        return FactionTraitSymbolString.imperialistic;
      case 'TREASURE_HUNTERS':
        return FactionTraitSymbolString.treasureHunters;
      case 'DEXTEROUS':
        return FactionTraitSymbolString.dexterous;
      case 'UNPREDICTABLE':
        return FactionTraitSymbolString.unpredictable;
      case 'BRUTAL':
        return FactionTraitSymbolString.brutal;
      case 'FLEETING':
        return FactionTraitSymbolString.fleeting;
      case 'ADAPTABLE':
        return FactionTraitSymbolString.adaptable;
      case 'SELF_SUFFICIENT':
        return FactionTraitSymbolString.selfSufficient;
      case 'DEFENSIVE':
        return FactionTraitSymbolString.defensive;
      case 'PROUD':
        return FactionTraitSymbolString.proud;
      case 'DIVERSE':
        return FactionTraitSymbolString.diverse;
      case 'INDEPENDENT':
        return FactionTraitSymbolString.independent;
      case 'SELF_INTERESTED':
        return FactionTraitSymbolString.selfInterested;
      case 'FRAGMENTED':
        return FactionTraitSymbolString.fragmented;
      case 'COMMERCIAL':
        return FactionTraitSymbolString.commercial;
      case 'FREE_MARKETS':
        return FactionTraitSymbolString.freeMarkets;
      case 'ENTREPRENEURIAL':
        return FactionTraitSymbolString.entrepreneurial;
      default:
        throw Exception('Unknown FactionTraitSymbolString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case FactionTraitSymbolString.bureaucratic:
        return 'BUREAUCRATIC';
      case FactionTraitSymbolString.secretive:
        return 'SECRETIVE';
      case FactionTraitSymbolString.capitalistic:
        return 'CAPITALISTIC';
      case FactionTraitSymbolString.industrious:
        return 'INDUSTRIOUS';
      case FactionTraitSymbolString.peaceful:
        return 'PEACEFUL';
      case FactionTraitSymbolString.distrustful:
        return 'DISTRUSTFUL';
      case FactionTraitSymbolString.welcoming:
        return 'WELCOMING';
      case FactionTraitSymbolString.smugglers:
        return 'SMUGGLERS';
      case FactionTraitSymbolString.scavengers:
        return 'SCAVENGERS';
      case FactionTraitSymbolString.rebellious:
        return 'REBELLIOUS';
      case FactionTraitSymbolString.exiles:
        return 'EXILES';
      case FactionTraitSymbolString.pirates:
        return 'PIRATES';
      case FactionTraitSymbolString.raiders:
        return 'RAIDERS';
      case FactionTraitSymbolString.clan:
        return 'CLAN';
      case FactionTraitSymbolString.guild:
        return 'GUILD';
      case FactionTraitSymbolString.dominion:
        return 'DOMINION';
      case FactionTraitSymbolString.fringe:
        return 'FRINGE';
      case FactionTraitSymbolString.forsaken:
        return 'FORSAKEN';
      case FactionTraitSymbolString.isolated:
        return 'ISOLATED';
      case FactionTraitSymbolString.localized:
        return 'LOCALIZED';
      case FactionTraitSymbolString.established:
        return 'ESTABLISHED';
      case FactionTraitSymbolString.notable:
        return 'NOTABLE';
      case FactionTraitSymbolString.dominant:
        return 'DOMINANT';
      case FactionTraitSymbolString.inescapable:
        return 'INESCAPABLE';
      case FactionTraitSymbolString.innovative:
        return 'INNOVATIVE';
      case FactionTraitSymbolString.bold:
        return 'BOLD';
      case FactionTraitSymbolString.visionary:
        return 'VISIONARY';
      case FactionTraitSymbolString.curious:
        return 'CURIOUS';
      case FactionTraitSymbolString.daring:
        return 'DARING';
      case FactionTraitSymbolString.exploratory:
        return 'EXPLORATORY';
      case FactionTraitSymbolString.resourceful:
        return 'RESOURCEFUL';
      case FactionTraitSymbolString.flexible:
        return 'FLEXIBLE';
      case FactionTraitSymbolString.cooperative:
        return 'COOPERATIVE';
      case FactionTraitSymbolString.united:
        return 'UNITED';
      case FactionTraitSymbolString.strategic:
        return 'STRATEGIC';
      case FactionTraitSymbolString.intelligent:
        return 'INTELLIGENT';
      case FactionTraitSymbolString.researchFocused:
        return 'RESEARCH_FOCUSED';
      case FactionTraitSymbolString.collaborative:
        return 'COLLABORATIVE';
      case FactionTraitSymbolString.progressive:
        return 'PROGRESSIVE';
      case FactionTraitSymbolString.militaristic:
        return 'MILITARISTIC';
      case FactionTraitSymbolString.technologicallyAdvanced:
        return 'TECHNOLOGICALLY_ADVANCED';
      case FactionTraitSymbolString.aggressive:
        return 'AGGRESSIVE';
      case FactionTraitSymbolString.imperialistic:
        return 'IMPERIALISTIC';
      case FactionTraitSymbolString.treasureHunters:
        return 'TREASURE_HUNTERS';
      case FactionTraitSymbolString.dexterous:
        return 'DEXTEROUS';
      case FactionTraitSymbolString.unpredictable:
        return 'UNPREDICTABLE';
      case FactionTraitSymbolString.brutal:
        return 'BRUTAL';
      case FactionTraitSymbolString.fleeting:
        return 'FLEETING';
      case FactionTraitSymbolString.adaptable:
        return 'ADAPTABLE';
      case FactionTraitSymbolString.selfSufficient:
        return 'SELF_SUFFICIENT';
      case FactionTraitSymbolString.defensive:
        return 'DEFENSIVE';
      case FactionTraitSymbolString.proud:
        return 'PROUD';
      case FactionTraitSymbolString.diverse:
        return 'DIVERSE';
      case FactionTraitSymbolString.independent:
        return 'INDEPENDENT';
      case FactionTraitSymbolString.selfInterested:
        return 'SELF_INTERESTED';
      case FactionTraitSymbolString.fragmented:
        return 'FRAGMENTED';
      case FactionTraitSymbolString.commercial:
        return 'COMMERCIAL';
      case FactionTraitSymbolString.freeMarkets:
        return 'FREE_MARKETS';
      case FactionTraitSymbolString.entrepreneurial:
        return 'ENTREPRENEURIAL';
    }
  }
}
