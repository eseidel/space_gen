enum MarketTransactionType {
  PURCHASE('PURCHASE'),
  SELL('SELL');

  const MarketTransactionType(this.value);

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
