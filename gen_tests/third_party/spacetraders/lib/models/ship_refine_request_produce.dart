/// The type of good to produce out of the refining process.
enum ShipRefineRequestProduce {
  iron._('IRON'),
  copper._('COPPER'),
  silver._('SILVER'),
  gold._('GOLD'),
  aluminum._('ALUMINUM'),
  platinum._('PLATINUM'),
  uranite._('URANITE'),
  meritium._('MERITIUM'),
  fuel._('FUEL');

  const ShipRefineRequestProduce._(this.value);

  /// Creates a ShipRefineRequestProduce from a json value.
  factory ShipRefineRequestProduce.fromJson(String json) {
    return ShipRefineRequestProduce.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ShipRefineRequestProduce value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipRefineRequestProduce? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipRefineRequestProduce.fromJson(json);
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
