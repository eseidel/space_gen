// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CombinedBillingUsage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CombinedBillingUsage(
        daysLeftInBillingCycle: 0,
        estimatedPaidStorageForMonth: 0,
        estimatedStorageForMonth: 0,
      );
      final parsed = CombinedBillingUsage.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CombinedBillingUsage.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CombinedBillingUsage.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
