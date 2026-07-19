// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesListSecretsForAuthenticatedUser200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodespacesListSecretsForAuthenticatedUser200Response(
        totalCount: 0,
        secrets: <CodespacesSecret>[
          CodespacesSecret(
            name: 'SECRET_NAME',
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
            visibility: CodespacesSecretVisibility.all,
            selectedRepositoriesUrl: Uri.parse('https://example.com'),
          ),
        ],
      );
      final parsed =
          CodespacesListSecretsForAuthenticatedUser200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesListSecretsForAuthenticatedUser200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CodespacesListSecretsForAuthenticatedUser200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
