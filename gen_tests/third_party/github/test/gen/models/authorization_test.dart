// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Authorization', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Authorization(
        id: 0,
        url: Uri.parse('https://example.com'),
        scopes: const <String>['example'],
        token: 'example',
        tokenLastEight: 'example',
        hashedToken: 'example',
        app: AuthorizationApp(
          clientId: 'example',
          name: 'example',
          url: Uri.parse('https://example.com'),
        ),
        note: 'example',
        noteUrl: Uri.parse('https://example.com'),
        updatedAt: DateTime.utc(2024),
        createdAt: DateTime.utc(2024),
        fingerprint: 'example',
        expiresAt: DateTime.utc(2024),
      );
      final parsed = Authorization.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Authorization.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Authorization.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
