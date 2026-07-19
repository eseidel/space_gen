// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PrivateApplicationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PrivateApplicationResponse(
        id: SnowflakeType('0'),
        name: 'example',
        icon: 'example',
        description: 'example',
        type: ApplicationTypes.guildRoleSubscriptions,
        verifyKey: 'example',
        flags: 0,
        redirectUris: <Uri>[Uri.parse('https://example.com')],
        interactionsEndpointUrl: Uri.parse('https://example.com'),
        roleConnectionsVerificationUrl: Uri.parse('https://example.com'),
        owner: UserResponse(
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
        approximateGuildCount: 0,
        approximateUserInstallCount: 0,
        approximateUserAuthorizationCount: 0,
        explicitContentFilter: ApplicationExplicitContentFilterTypes.inherit,
        team: TeamResponse(
          id: SnowflakeType('0'),
          icon: 'example',
          name: 'example',
          ownerUserId: SnowflakeType('0'),
          members: <TeamMemberResponse>[
            TeamMemberResponse(
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
              teamId: SnowflakeType('0'),
              membershipState: TeamMembershipStates.invited,
              role: TeamMemberRoles.admin,
              permissions: const <String>['example'],
            ),
          ],
        ),
      );
      final parsed = PrivateApplicationResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PrivateApplicationResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PrivateApplicationResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
