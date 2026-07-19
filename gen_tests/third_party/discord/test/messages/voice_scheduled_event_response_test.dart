// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('VoiceScheduledEventResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = VoiceScheduledEventResponse(
        id: SnowflakeType('0'),
        guildId: SnowflakeType('0'),
        name: 'example',
        description: 'example',
        channelId: SnowflakeType('0'),
        creatorId: SnowflakeType('0'),
        image: 'example',
        scheduledStartTime: DateTime.utc(2024),
        scheduledEndTime: DateTime.utc(2024),
        status: GuildScheduledEventStatuses.scheduled,
        entityId: SnowflakeType('0'),
        privacyLevel: GuildScheduledEventPrivacyLevels.guildOnly,
        entityMetadata: const EntityMetadataVoiceResponse(),
      );
      final parsed = VoiceScheduledEventResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(VoiceScheduledEventResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => VoiceScheduledEventResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
