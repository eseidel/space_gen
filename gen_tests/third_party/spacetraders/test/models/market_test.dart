// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Market', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Market(
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
      );
      final parsed = Market.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Market.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Market.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
