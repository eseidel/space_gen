enum MarketTradeGoodType {
  EXPORT._('EXPORT'),
  IMPORT._('IMPORT'),
  EXCHANGE._('EXCHANGE');

  const MarketTradeGoodType._(this.value);

  factory MarketTradeGoodType.fromJson(String json) {
    return MarketTradeGoodType.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () =>
              throw FormatException('Unknown MarketTradeGoodType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MarketTradeGoodType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MarketTradeGoodType.fromJson(json);
  }

  final String value;

  String toJson() => value;
}
