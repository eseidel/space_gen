// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateForAuthenticatedUserRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateForAuthenticatedUserRequest(
        name: 'Team Environment',
      );
      final parsed = ReposCreateForAuthenticatedUserRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposCreateForAuthenticatedUserRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateForAuthenticatedUserRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
