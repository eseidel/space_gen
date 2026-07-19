// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesDeleteCodespacesAccessUsersRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodespacesDeleteCodespacesAccessUsersRequest(
        selectedUsernames: <String>['example'],
      );
      final parsed = CodespacesDeleteCodespacesAccessUsersRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesDeleteCodespacesAccessUsersRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodespacesDeleteCodespacesAccessUsersRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
