// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('SiphonYield', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SiphonYield(
        symbol: TradeSymbol.preciousStones,
        units: 0,
      );
      final parsed = SiphonYield.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SiphonYield.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SiphonYield.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
