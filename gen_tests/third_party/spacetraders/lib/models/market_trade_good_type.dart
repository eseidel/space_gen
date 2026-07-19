/// The type of trade good (export, import, or exchange).
enum MarketTradeGoodType {
  export_._('EXPORT'),
  import_._('IMPORT'),
  exchange._('EXCHANGE');

  const MarketTradeGoodType._(this.value);

  /// Creates a MarketTradeGoodType from a json value.
  factory MarketTradeGoodType.fromJson(String json) {
    return MarketTradeGoodType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown MarketTradeGoodType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MarketTradeGoodType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MarketTradeGoodType.fromJson(json);
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
