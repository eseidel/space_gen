// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsBillingUsage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsBillingUsage(
        totalMinutesUsed: 0,
        totalPaidMinutesUsed: 0,
        includedMinutes: 0,
        minutesUsedBreakdown: ActionsBillingUsageMinutesUsedBreakdown(),
      );
      final parsed = ActionsBillingUsage.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsBillingUsage.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsBillingUsage.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
