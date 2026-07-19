// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('UsersDeleteSocialAccountForAuthenticatedUserRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UsersDeleteSocialAccountForAuthenticatedUserRequest(
        accountUrls: <String>['https://twitter.com/github'],
      );
      final parsed =
          UsersDeleteSocialAccountForAuthenticatedUserRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        UsersDeleteSocialAccountForAuthenticatedUserRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UsersDeleteSocialAccountForAuthenticatedUserRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
