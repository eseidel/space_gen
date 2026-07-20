// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PrivateRegistriesUpdateOrgPrivateRegistryRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PrivateRegistriesUpdateOrgPrivateRegistryRequest();
      final parsed =
          PrivateRegistriesUpdateOrgPrivateRegistryRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PrivateRegistriesUpdateOrgPrivateRegistryRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
