// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ListGuildIntegrations200ResponseInner', () {
    test('DiscordIntegrationResponse round-trips via maybeFromJson/toJson', () {
      final instance = DiscordIntegrationResponse(
        name: 'example',
        account: const AccountResponse(id: 'example', name: 'example'),
        enabled: false,
        id: SnowflakeType('0'),
        application: IntegrationApplicationResponse(
          id: SnowflakeType('0'),
          name: 'example',
          icon: 'example',
          description: 'example',
          type: ApplicationTypes.guildRoleSubscriptions,
        ),
        scopes: const <OAuth2Scopes>[OAuth2Scopes.identify],
      );
      final parsed = DiscordIntegrationResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test(
      'ExternalConnectionIntegrationResponse round-trips via maybeFromJson/toJson',
      () {
        final instance = ExternalConnectionIntegrationResponse(
          type: IntegrationTypes.discord,
          name: 'example',
          account: const AccountResponse(id: 'example', name: 'example'),
          enabled: false,
          id: 'example',
          user: UserResponse(
            id: SnowflakeType('0'),
            username: 'example',
            avatar: 'example',
            discriminator: 'example',
            publicFlags: 0,
            flags: Int53Type(-9007199254740991),
            globalName: 'example',
            primaryGuild: UserPrimaryGuildResponse(
              identityGuildId: SnowflakeType('0'),
              identityEnabled: false,
              tag: 'example',
              badge: 'example',
            ),
          ),
        );
        final parsed = ExternalConnectionIntegrationResponse.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'GuildSubscriptionIntegrationResponse round-trips via maybeFromJson/toJson',
      () {
        final instance = GuildSubscriptionIntegrationResponse(
          name: 'example',
          account: const AccountResponse(id: 'example', name: 'example'),
          enabled: false,
          id: SnowflakeType('0'),
        );
        final parsed = GuildSubscriptionIntegrationResponse.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(ListGuildIntegrations200ResponseInner.maybeFromJson(null), isNull);
    });
  });
}
