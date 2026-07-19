// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposRemoveUserAccessRestrictionsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposRemoveUserAccessRestrictionsRequest(
        users: <String>['example'],
      );
      final parsed = ReposRemoveUserAccessRestrictionsRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposRemoveUserAccessRestrictionsRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposRemoveUserAccessRestrictionsRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
