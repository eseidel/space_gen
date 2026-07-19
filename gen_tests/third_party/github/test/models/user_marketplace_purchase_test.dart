// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('UserMarketplacePurchase', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UserMarketplacePurchase(
        billingCycle: 'monthly',
        nextBillingDate: DateTime.utc(2024),
        unitCount: 0,
        onFreeTrial: false,
        freeTrialEndsOn: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        account: MarketplaceAccount(
          url: Uri.parse('https://example.com'),
          id: 0,
          type: 'example',
          login: 'example',
        ),
        plan: MarketplaceListingPlan(
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
        ),
      );
      final parsed = UserMarketplacePurchase.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UserMarketplacePurchase.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UserMarketplacePurchase.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
