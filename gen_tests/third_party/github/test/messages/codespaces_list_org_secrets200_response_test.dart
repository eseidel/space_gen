// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesListOrgSecrets200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodespacesListOrgSecrets200Response(
        totalCount: 0,
        secrets: <CodespacesOrgSecret>[
          CodespacesOrgSecret(
            name: 'SECRET_NAME',
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
            visibility: CodespacesOrgSecretVisibility.all,
          ),
        ],
      );
      final parsed = CodespacesListOrgSecrets200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodespacesListOrgSecrets200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodespacesListOrgSecrets200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
