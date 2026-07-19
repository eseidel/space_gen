// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipRefine201ResponseDataProducedInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipRefine201ResponseDataProducedInner(
        tradeSymbol: TradeSymbol.preciousStones,
        units: 0,
      );
      final parsed = ShipRefine201ResponseDataProducedInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ShipRefine201ResponseDataProducedInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipRefine201ResponseDataProducedInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
