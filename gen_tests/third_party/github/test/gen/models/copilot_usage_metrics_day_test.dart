// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotUsageMetricsDay', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotUsageMetricsDay(
        date: Date(2024, 1, 1),
        entries: <String, dynamic>{},
      );
      final parsed = CopilotUsageMetricsDay.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotUsageMetricsDay.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CopilotUsageMetricsDay.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
