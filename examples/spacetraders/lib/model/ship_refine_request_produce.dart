enum ShipRefineRequestProduce {
  IRON._('IRON'),
  COPPER._('COPPER'),
  SILVER._('SILVER'),
  GOLD._('GOLD'),
  ALUMINUM._('ALUMINUM'),
  PLATINUM._('PLATINUM'),
  URANITE._('URANITE'),
  MERITIUM._('MERITIUM'),
  FUEL._('FUEL');

  const ShipRefineRequestProduce._(this.value);

  factory ShipRefineRequestProduce.fromJson(String json) {
    return ShipRefineRequestProduce.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () =>
              throw FormatException(
                'Unknown ShipRefineRequestProduce value: $json',
              ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipRefineRequestProduce? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipRefineRequestProduce.fromJson(json);
  }

  final String value;

  String toJson() => value;
}
