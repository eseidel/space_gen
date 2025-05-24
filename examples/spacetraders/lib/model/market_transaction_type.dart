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

  final String value;

  String toJson() => value;
}
