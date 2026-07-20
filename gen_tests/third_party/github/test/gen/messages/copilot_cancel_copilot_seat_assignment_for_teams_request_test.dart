// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotCancelCopilotSeatAssignmentForTeamsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CopilotCancelCopilotSeatAssignmentForTeamsRequest(
        selectedTeams: const <String>['example'],
      );
      final parsed =
          CopilotCancelCopilotSeatAssignmentForTeamsRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CopilotCancelCopilotSeatAssignmentForTeamsRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CopilotCancelCopilotSeatAssignmentForTeamsRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
