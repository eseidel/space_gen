// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ExtractionYield', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ExtractionYield(
        symbol: TradeSymbol.preciousStones,
        units: 0,
      );
      final parsed = ExtractionYield.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ExtractionYield.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ExtractionYield.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
