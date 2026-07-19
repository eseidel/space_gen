// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgPrivateRegistryConfiguration', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrgPrivateRegistryConfiguration(
        name: 'MAVEN_REPOSITORY_SECRET',
        registryType:
            OrgPrivateRegistryConfigurationRegistryType.mavenRepository,
        visibility: OrgPrivateRegistryConfigurationVisibility.all,
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
      );
      final parsed = OrgPrivateRegistryConfiguration.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgPrivateRegistryConfiguration.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            OrgPrivateRegistryConfiguration.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
