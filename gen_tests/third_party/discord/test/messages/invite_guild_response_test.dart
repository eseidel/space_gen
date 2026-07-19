// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('InviteGuildResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = InviteGuildResponse(
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
      );
      final parsed = InviteGuildResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InviteGuildResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InviteGuildResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
