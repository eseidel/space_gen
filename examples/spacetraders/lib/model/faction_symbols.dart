enum FactionSymbols {
  cosmic('COSMIC'),
  void_('VOID'),
  galactic('GALACTIC'),
  quantum('QUANTUM'),
  dominion('DOMINION'),
  astro('ASTRO'),
  corsairs('CORSAIRS'),
  obsidian('OBSIDIAN'),
  aegis('AEGIS'),
  united('UNITED'),
  solitary('SOLITARY'),
  cobalt('COBALT'),
  omega('OMEGA'),
  echo('ECHO'),
  lords('LORDS'),
  cult('CULT'),
  ancients('ANCIENTS'),
  shadow('SHADOW'),
  ethereal('ETHEREAL'),
  ;

  const FactionSymbols(this.value);

  factory FactionSymbols.fromJson(String json) {
    switch (json) {
      case 'COSMIC':
        return FactionSymbols.cosmic;
      case 'VOID':
        return FactionSymbols.void_;
      case 'GALACTIC':
        return FactionSymbols.galactic;
      case 'QUANTUM':
        return FactionSymbols.quantum;
      case 'DOMINION':
        return FactionSymbols.dominion;
      case 'ASTRO':
        return FactionSymbols.astro;
      case 'CORSAIRS':
        return FactionSymbols.corsairs;
      case 'OBSIDIAN':
        return FactionSymbols.obsidian;
      case 'AEGIS':
        return FactionSymbols.aegis;
      case 'UNITED':
        return FactionSymbols.united;
      case 'SOLITARY':
        return FactionSymbols.solitary;
      case 'COBALT':
        return FactionSymbols.cobalt;
      case 'OMEGA':
        return FactionSymbols.omega;
      case 'ECHO':
        return FactionSymbols.echo;
      case 'LORDS':
        return FactionSymbols.lords;
      case 'CULT':
        return FactionSymbols.cult;
      case 'ANCIENTS':
        return FactionSymbols.ancients;
      case 'SHADOW':
        return FactionSymbols.shadow;
      case 'ETHEREAL':
        return FactionSymbols.ethereal;
      default:
        throw Exception('Unknown FactionSymbols value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case FactionSymbols.cosmic:
        return 'COSMIC';
      case FactionSymbols.void_:
        return 'VOID';
      case FactionSymbols.galactic:
        return 'GALACTIC';
      case FactionSymbols.quantum:
        return 'QUANTUM';
      case FactionSymbols.dominion:
        return 'DOMINION';
      case FactionSymbols.astro:
        return 'ASTRO';
      case FactionSymbols.corsairs:
        return 'CORSAIRS';
      case FactionSymbols.obsidian:
        return 'OBSIDIAN';
      case FactionSymbols.aegis:
        return 'AEGIS';
      case FactionSymbols.united:
        return 'UNITED';
      case FactionSymbols.solitary:
        return 'SOLITARY';
      case FactionSymbols.cobalt:
        return 'COBALT';
      case FactionSymbols.omega:
        return 'OMEGA';
      case FactionSymbols.echo:
        return 'ECHO';
      case FactionSymbols.lords:
        return 'LORDS';
      case FactionSymbols.cult:
        return 'CULT';
      case FactionSymbols.ancients:
        return 'ANCIENTS';
      case FactionSymbols.shadow:
        return 'SHADOW';
      case FactionSymbols.ethereal:
        return 'ETHEREAL';
    }
  }
}
