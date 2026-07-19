// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotListOrgSecrets200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DependabotListOrgSecrets200Response(
        totalCount: 0,
        secrets: <OrganizationDependabotSecret>[
          OrganizationDependabotSecret(
            name: 'SECRET_TOKEN',
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
            visibility: OrganizationDependabotSecretVisibility.all,
          ),
        ],
      );
      final parsed = DependabotListOrgSecrets200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependabotListOrgSecrets200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotListOrgSecrets200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
