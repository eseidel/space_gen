// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotCancelCopilotSeatAssignmentForUsersRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CopilotCancelCopilotSeatAssignmentForUsersRequest(
        selectedUsernames: const <String>['example'],
      );
      final parsed =
          CopilotCancelCopilotSeatAssignmentForUsersRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CopilotCancelCopilotSeatAssignmentForUsersRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CopilotCancelCopilotSeatAssignmentForUsersRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
