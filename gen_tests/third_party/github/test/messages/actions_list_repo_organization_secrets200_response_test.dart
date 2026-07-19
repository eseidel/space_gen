// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListRepoOrganizationSecrets200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsListRepoOrganizationSecrets200Response(
        totalCount: 0,
        secrets: <ActionsSecret>[
          ActionsSecret(
            name: 'SECRET_TOKEN',
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
          ),
        ],
      );
      final parsed =
          ActionsListRepoOrganizationSecrets200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsListRepoOrganizationSecrets200Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsListRepoOrganizationSecrets200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
