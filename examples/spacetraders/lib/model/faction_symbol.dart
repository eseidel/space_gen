enum FactionSymbol {
  COSMIC('COSMIC'),
  VOID('VOID'),
  GALACTIC('GALACTIC'),
  QUANTUM('QUANTUM'),
  DOMINION('DOMINION'),
  ASTRO('ASTRO'),
  CORSAIRS('CORSAIRS'),
  OBSIDIAN('OBSIDIAN'),
  AEGIS('AEGIS'),
  UNITED('UNITED'),
  SOLITARY('SOLITARY'),
  COBALT('COBALT'),
  OMEGA('OMEGA'),
  ECHO('ECHO'),
  LORDS('LORDS'),
  CULT('CULT'),
  ANCIENTS('ANCIENTS'),
  SHADOW('SHADOW'),
  ETHEREAL('ETHEREAL');

  const FactionSymbol(this.value);

  factory FactionSymbol.fromJson(String json) {
    return FactionSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown FactionSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
