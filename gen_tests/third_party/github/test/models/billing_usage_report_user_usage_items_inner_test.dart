// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('BillingUsageReportUserUsageItemsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BillingUsageReportUserUsageItemsInner(
        date: 'example',
        product: 'example',
        sku: 'example',
        quantity: 0,
        unitType: 'example',
        pricePerUnit: 0,
        grossAmount: 0,
        discountAmount: 0,
        netAmount: 0,
      );
      final parsed = BillingUsageReportUserUsageItemsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BillingUsageReportUserUsageItemsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BillingUsageReportUserUsageItemsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
