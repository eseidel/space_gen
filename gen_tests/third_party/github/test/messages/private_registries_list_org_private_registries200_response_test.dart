// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PrivateRegistriesListOrgPrivateRegistries200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PrivateRegistriesListOrgPrivateRegistries200Response(
        totalCount: 0,
        configurations: <OrgPrivateRegistryConfiguration>[
          OrgPrivateRegistryConfiguration(
            name: 'MAVEN_REPOSITORY_SECRET',
            registryType:
                OrgPrivateRegistryConfigurationRegistryType.mavenRepository,
            visibility: OrgPrivateRegistryConfigurationVisibility.all,
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
          ),
        ],
      );
      final parsed =
          PrivateRegistriesListOrgPrivateRegistries200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PrivateRegistriesListOrgPrivateRegistries200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            PrivateRegistriesListOrgPrivateRegistries200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
