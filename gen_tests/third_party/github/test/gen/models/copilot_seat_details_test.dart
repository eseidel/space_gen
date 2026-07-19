// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotSeatDetails', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CopilotSeatDetails(createdAt: DateTime.utc(2024));
      final parsed = CopilotSeatDetails.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotSeatDetails.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CopilotSeatDetails.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
