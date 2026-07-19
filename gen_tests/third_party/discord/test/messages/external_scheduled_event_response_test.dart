// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ExternalScheduledEventResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ExternalScheduledEventResponse(
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
        entityMetadata: const EntityMetadataExternalResponse(
          location: 'example',
        ),
      );
      final parsed = ExternalScheduledEventResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ExternalScheduledEventResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ExternalScheduledEventResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
