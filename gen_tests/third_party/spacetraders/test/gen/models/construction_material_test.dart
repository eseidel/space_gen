// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ConstructionMaterial', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ConstructionMaterial(
        tradeSymbol: TradeSymbol.preciousStones,
        required_: 0,
        fulfilled: 0,
      );
      final parsed = ConstructionMaterial.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ConstructionMaterial.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ConstructionMaterial.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
