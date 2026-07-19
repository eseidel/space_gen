// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotAddCopilotSeatsForUsersRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotAddCopilotSeatsForUsersRequest(
        selectedUsernames: <String>['example'],
      );
      final parsed = CopilotAddCopilotSeatsForUsersRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotAddCopilotSeatsForUsersRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CopilotAddCopilotSeatsForUsersRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
