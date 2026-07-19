// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('MarketTradeGood', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MarketTradeGood(
        symbol: TradeSymbol.preciousStones,
        type: MarketTradeGoodType.export_,
        tradeVolume: 1,
        supply: SupplyLevel.scarce,
        purchasePrice: 0,
        sellPrice: 0,
      );
      final parsed = MarketTradeGood.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MarketTradeGood.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MarketTradeGood.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
