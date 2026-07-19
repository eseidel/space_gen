// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('UsersCreateSshSigningKeyForAuthenticatedUserRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UsersCreateSshSigningKeyForAuthenticatedUserRequest(
        key: 'example',
      );
      final parsed =
          UsersCreateSshSigningKeyForAuthenticatedUserRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        UsersCreateSshSigningKeyForAuthenticatedUserRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UsersCreateSshSigningKeyForAuthenticatedUserRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
