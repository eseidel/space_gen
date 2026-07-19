// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MarketplacePurchaseMarketplacePendingChange', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MarketplacePurchaseMarketplacePendingChange();
      final parsed = MarketplacePurchaseMarketplacePendingChange.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        MarketplacePurchaseMarketplacePendingChange.maybeFromJson(null),
        isNull,
      );
    });
  });
}
