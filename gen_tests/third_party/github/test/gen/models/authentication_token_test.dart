// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AuthenticationToken', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AuthenticationToken(
        token: 'v1.1f699f1069f60xxx',
        expiresAt: DateTime.utc(2024),
      );
      final parsed = AuthenticationToken.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AuthenticationToken.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AuthenticationToken.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
