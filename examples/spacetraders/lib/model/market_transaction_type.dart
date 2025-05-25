enum MarketTransactionType {
  PURCHASE._('PURCHASE'),
  SELL._('SELL');

  const MarketTransactionType._(this.value);

  factory MarketTransactionType.fromJson(String json) {
    return MarketTransactionType.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () => throw Exception('Unknown MarketTransactionType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MarketTransactionType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MarketTransactionType.fromJson(json);
  }

  final String value;

  String toJson() => value;
}
