// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PackagesBillingUsage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PackagesBillingUsage(
        totalGigabytesBandwidthUsed: 0,
        totalPaidGigabytesBandwidthUsed: 0,
        includedGigabytesBandwidth: 0,
      );
      final parsed = PackagesBillingUsage.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PackagesBillingUsage.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PackagesBillingUsage.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
