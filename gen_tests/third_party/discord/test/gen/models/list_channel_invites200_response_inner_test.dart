// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ListChannelInvites200ResponseInner', () {
    test('FriendInviteResponse round-trips via maybeFromJson/toJson', () {
      final instance = FriendInviteResponse(
        code: 'example',
        expiresAt: DateTime.utc(2024),
        channel: InviteChannelResponse(
          id: SnowflakeType('0'),
          type: ChannelTypes.dm,
          name: 'example',
        ),
      );
      final parsed = FriendInviteResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('GroupDmInviteResponse round-trips via maybeFromJson/toJson', () {
      final instance = GroupDmInviteResponse(
        code: 'example',
        expiresAt: DateTime.utc(2024),
        channel: InviteChannelResponse(
          id: SnowflakeType('0'),
          type: ChannelTypes.dm,
          name: 'example',
        ),
      );
      final parsed = GroupDmInviteResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('GuildInviteResponse round-trips via maybeFromJson/toJson', () {
      final instance = GuildInviteResponse(
        code: 'example',
        expiresAt: DateTime.utc(2024),
        guild: InviteGuildResponse(
          id: SnowflakeType('0'),
          name: 'example',
          splash: 'example',
          banner: 'example',
          description: 'example',
          icon: 'example',
          features: const <GuildFeatures>[GuildFeatures.animatedBanner],
          verificationLevel: VerificationLevels.none,
          vanityUrlCode: 'example',
          nsfwLevel: GuildNsfwContentLevel.default_,
          nsfw: false,
          premiumSubscriptionCount: 0,
        ),
        guildId: SnowflakeType('0'),
        channel: InviteChannelResponse(
          id: SnowflakeType('0'),
          type: ChannelTypes.dm,
          name: 'example',
        ),
      );
      final parsed = GuildInviteResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ListChannelInvites200ResponseInner.maybeFromJson(null), isNull);
    });
  });
}
