// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MarketplacePurchase', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MarketplacePurchase(
        url: 'example',
        type: 'example',
        id: 0,
        login: 'example',
        marketplacePurchase: MarketplacePurchaseMarketplacePurchase(),
      );
      final parsed = MarketplacePurchase.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MarketplacePurchase.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MarketplacePurchase.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
