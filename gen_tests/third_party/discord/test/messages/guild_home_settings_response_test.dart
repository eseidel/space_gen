// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildHomeSettingsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildHomeSettingsResponse(
        guildId: SnowflakeType('0'),
        enabled: false,
        newMemberActions: <NewMemberActionResponse>[
          NewMemberActionResponse(
            channelId: SnowflakeType('0'),
            actionType: NewMemberActionType.view,
            title: 'example',
            description: 'example',
          ),
        ],
        resourceChannels: <ResourceChannelResponse>[
          ResourceChannelResponse(
            channelId: SnowflakeType('0'),
            title: 'example',
            description: 'example',
          ),
        ],
      );
      final parsed = GuildHomeSettingsResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildHomeSettingsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildHomeSettingsResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
