// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotCancelCopilotSeatAssignmentForUsers200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotCancelCopilotSeatAssignmentForUsers200Response(
        seatsCancelled: 0,
      );
      final parsed =
          CopilotCancelCopilotSeatAssignmentForUsers200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CopilotCancelCopilotSeatAssignmentForUsers200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CopilotCancelCopilotSeatAssignmentForUsers200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
