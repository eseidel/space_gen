// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotAddCopilotSeatsForUsers201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotAddCopilotSeatsForUsers201Response(
        seatsCreated: 0,
      );
      final parsed = CopilotAddCopilotSeatsForUsers201Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CopilotAddCopilotSeatsForUsers201Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CopilotAddCopilotSeatsForUsers201Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
