// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Siphon', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Siphon(
        shipSymbol: 'example',
        yield_: SiphonYield(symbol: TradeSymbol.preciousStones, units: 0),
      );
      final parsed = Siphon.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Siphon.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Siphon.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
