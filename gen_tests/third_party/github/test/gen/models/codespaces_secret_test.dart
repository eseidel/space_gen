// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesSecret', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodespacesSecret(
        name: 'SECRET_NAME',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        visibility: CodespacesSecretVisibility.all,
        selectedRepositoriesUrl: Uri.parse('https://example.com'),
      );
      final parsed = CodespacesSecret.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodespacesSecret.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodespacesSecret.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
