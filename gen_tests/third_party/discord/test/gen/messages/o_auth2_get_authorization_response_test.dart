// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('OAuth2GetAuthorizationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OAuth2GetAuthorizationResponse(
        application: ApplicationResponse(
          id: SnowflakeType('0'),
          name: 'example',
          icon: 'example',
          description: 'example',
          type: ApplicationTypes.guildRoleSubscriptions,
          verifyKey: 'example',
          flags: 0,
        ),
        expires: DateTime.utc(2024),
        scopes: const <OAuth2Scopes>[OAuth2Scopes.identify],
      );
      final parsed = OAuth2GetAuthorizationResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OAuth2GetAuthorizationResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OAuth2GetAuthorizationResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
