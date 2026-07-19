// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TeamResponse(
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
      );
      final parsed = TeamResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
