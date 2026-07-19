// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesOrgSecret', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodespacesOrgSecret(
        name: 'SECRET_NAME',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        visibility: CodespacesOrgSecretVisibility.all,
      );
      final parsed = CodespacesOrgSecret.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodespacesOrgSecret.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodespacesOrgSecret.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
