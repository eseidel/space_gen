enum MarketTradeGoodType {
  EXPORT._('EXPORT'),
  IMPORT._('IMPORT'),
  EXCHANGE._('EXCHANGE');

  const MarketTradeGoodType._(this.value);

  factory MarketTradeGoodType.fromJson(String json) {
    return MarketTradeGoodType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown MarketTradeGoodType value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
