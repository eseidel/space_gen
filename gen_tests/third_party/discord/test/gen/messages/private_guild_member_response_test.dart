// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PrivateGuildMemberResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PrivateGuildMemberResponse(
        avatar: 'example',
        banner: 'example',
        communicationDisabledUntil: DateTime.utc(2024),
        flags: 0,
        joinedAt: DateTime.utc(2024),
        nick: 'example',
        pending: false,
        premiumSince: DateTime.utc(2024),
        roles: <SnowflakeType>[SnowflakeType('0')],
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
        mute: false,
        deaf: false,
      );
      final parsed = PrivateGuildMemberResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PrivateGuildMemberResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PrivateGuildMemberResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
