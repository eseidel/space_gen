// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('BillingUsageReportUsageItemsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BillingUsageReportUsageItemsInner(
        date: 'example',
        product: 'example',
        sku: 'example',
        quantity: 0,
        unitType: 'example',
        pricePerUnit: 0,
        grossAmount: 0,
        discountAmount: 0,
        netAmount: 0,
        organizationName: 'example',
      );
      final parsed = BillingUsageReportUsageItemsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BillingUsageReportUsageItemsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BillingUsageReportUsageItemsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
