// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotAddCopilotSeatsForTeams201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotAddCopilotSeatsForTeams201Response(
        seatsCreated: 0,
      );
      final parsed = CopilotAddCopilotSeatsForTeams201Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CopilotAddCopilotSeatsForTeams201Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CopilotAddCopilotSeatsForTeams201Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
