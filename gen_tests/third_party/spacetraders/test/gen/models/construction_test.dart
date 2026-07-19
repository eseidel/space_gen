// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Construction', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Construction(
        symbol: 'example',
        materials: <ConstructionMaterial>[
          ConstructionMaterial(
            tradeSymbol: TradeSymbol.preciousStones,
            required_: 0,
            fulfilled: 0,
          ),
        ],
        isComplete: false,
      );
      final parsed = Construction.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Construction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Construction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
