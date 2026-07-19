// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MarketplaceListingPlan', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MarketplaceListingPlan(
        url: Uri.parse('https://example.com'),
        accountsUrl: Uri.parse('https://example.com'),
        id: 1313,
        number: 3,
        name: 'Pro',
        description: 'A professional-grade CI solution',
        monthlyPriceInCents: 1099,
        yearlyPriceInCents: 11870,
        priceModel: MarketplaceListingPlanPriceModel.free,
        hasFreeTrial: false,
        unitName: 'example',
        state: 'published',
        bullets: const <String>['example'],
      );
      final parsed = MarketplaceListingPlan.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MarketplaceListingPlan.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MarketplaceListingPlan.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
