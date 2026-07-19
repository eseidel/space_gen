// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('TradeGood', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TradeGood(
        symbol: TradeSymbol.preciousStones,
        name: 'example',
        description: 'example',
      );
      final parsed = TradeGood.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TradeGood.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TradeGood.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
