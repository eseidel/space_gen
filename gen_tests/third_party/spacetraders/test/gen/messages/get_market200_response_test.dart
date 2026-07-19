// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetMarket200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetMarket200Response(
        data: Market(
          symbol: 'example',
          exports: <TradeGood>[
            TradeGood(
              symbol: TradeSymbol.preciousStones,
              name: 'example',
              description: 'example',
            ),
          ],
          imports: <TradeGood>[
            TradeGood(
              symbol: TradeSymbol.preciousStones,
              name: 'example',
              description: 'example',
            ),
          ],
          exchange: <TradeGood>[
            TradeGood(
              symbol: TradeSymbol.preciousStones,
              name: 'example',
              description: 'example',
            ),
          ],
        ),
      );
      final parsed = GetMarket200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetMarket200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetMarket200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
