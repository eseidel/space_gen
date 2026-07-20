// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Extraction', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Extraction(
        shipSymbol: 'example',
        yield_: const ExtractionYield(
          symbol: TradeSymbol.preciousStones,
          units: 0,
        ),
      );
      final parsed = Extraction.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Extraction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Extraction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
