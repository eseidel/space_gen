// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetConstruction200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetConstruction200Response(
        data: Construction(
          symbol: 'example',
          materials: <ConstructionMaterial>[
            ConstructionMaterial(
              tradeSymbol: TradeSymbol.preciousStones,
              required_: 0,
              fulfilled: 0,
            ),
          ],
          isComplete: false,
        ),
      );
      final parsed = GetConstruction200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetConstruction200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetConstruction200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
