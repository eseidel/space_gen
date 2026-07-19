// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MigrationsStartForAuthenticatedUserRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MigrationsStartForAuthenticatedUserRequest(
        repositories: <String>['acme/widgets'],
      );
      final parsed = MigrationsStartForAuthenticatedUserRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        MigrationsStartForAuthenticatedUserRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MigrationsStartForAuthenticatedUserRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
