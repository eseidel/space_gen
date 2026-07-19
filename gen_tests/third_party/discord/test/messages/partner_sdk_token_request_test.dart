// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PartnerSdkTokenRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PartnerSdkTokenRequest(
        clientId: SnowflakeType('0'),
        externalAuthToken: 'example',
        externalAuthType: ApplicationIdentityProviderAuthType.oidc,
      );
      final parsed = PartnerSdkTokenRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PartnerSdkTokenRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PartnerSdkTokenRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
