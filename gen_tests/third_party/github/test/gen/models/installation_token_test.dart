// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('InstallationToken', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = InstallationToken(
        token: 'example',
        expiresAt: 'example',
      );
      final parsed = InstallationToken.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InstallationToken.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InstallationToken.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
