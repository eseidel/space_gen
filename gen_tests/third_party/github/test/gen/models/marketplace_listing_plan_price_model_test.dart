// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MarketplaceListingPlanPriceModel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MarketplaceListingPlanPriceModel.free;
      final parsed = MarketplaceListingPlanPriceModel.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MarketplaceListingPlanPriceModel.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MarketplaceListingPlanPriceModel.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in MarketplaceListingPlanPriceModel.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in MarketplaceListingPlanPriceModel.values) {
        expect(
          MarketplaceListingPlanPriceModel.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
