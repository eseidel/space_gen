// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PrivateRegistriesGetOrgPublicKey200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PrivateRegistriesGetOrgPublicKey200Response(
        keyId: '012345678912345678',
        key: '2Sg8iYjAxxmI2LvUXpJjkYrMxURPc8r+dB7TJyvv1234',
      );
      final parsed = PrivateRegistriesGetOrgPublicKey200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PrivateRegistriesGetOrgPublicKey200Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PrivateRegistriesGetOrgPublicKey200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
