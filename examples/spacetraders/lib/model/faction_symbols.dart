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
    return FactionSymbols.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown FactionSymbols value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
