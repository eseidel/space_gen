// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PrivateRegistriesCreateOrgPrivateRegistryRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PrivateRegistriesCreateOrgPrivateRegistryRequest(
        registryType:
            PrivateRegistriesCreateOrgPrivateRegistryRequestRegistryType
                .mavenRepository,
        encryptedValue: 'example',
        keyId: 'example',
        visibility:
            PrivateRegistriesCreateOrgPrivateRegistryRequestVisibility.all,
      );
      final parsed =
          PrivateRegistriesCreateOrgPrivateRegistryRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PrivateRegistriesCreateOrgPrivateRegistryRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PrivateRegistriesCreateOrgPrivateRegistryRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
