enum MarketTradeGoodType {
  EXPORT('EXPORT'),
  IMPORT('IMPORT'),
  EXCHANGE('EXCHANGE');

  const MarketTradeGoodType(this.value);

  factory MarketTradeGoodType.fromJson(String json) {
    return MarketTradeGoodType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown MarketTradeGoodType value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
