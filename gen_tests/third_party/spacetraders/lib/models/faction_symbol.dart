/// The symbol of the faction.
enum FactionSymbol {
  cosmic._('COSMIC'),
  void_._('VOID'),
  galactic._('GALACTIC'),
  quantum._('QUANTUM'),
  dominion._('DOMINION'),
  astro._('ASTRO'),
  corsairs._('CORSAIRS'),
  obsidian._('OBSIDIAN'),
  aegis._('AEGIS'),
  united._('UNITED'),
  solitary._('SOLITARY'),
  cobalt._('COBALT'),
  omega._('OMEGA'),
  echo._('ECHO'),
  lords._('LORDS'),
  cult._('CULT'),
  ancients._('ANCIENTS'),
  shadow._('SHADOW'),
  ethereal._('ETHEREAL');

  const FactionSymbol._(this.value);

  /// Creates a FactionSymbol from a json value.
  factory FactionSymbol.fromJson(String json) {
    return FactionSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown FactionSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static FactionSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return FactionSymbol.fromJson(json);
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
