// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotCancelCopilotSeatAssignmentForTeams200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotCancelCopilotSeatAssignmentForTeams200Response(
        seatsCancelled: 0,
      );
      final parsed =
          CopilotCancelCopilotSeatAssignmentForTeams200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CopilotCancelCopilotSeatAssignmentForTeams200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CopilotCancelCopilotSeatAssignmentForTeams200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
