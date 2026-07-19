// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ScheduledEventResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ScheduledEventResponse(
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
        entityType: GuildScheduledEventEntityTypes.none,
        entityId: SnowflakeType('0'),
        privacyLevel: GuildScheduledEventPrivacyLevels.guildOnly,
      );
      final parsed = ScheduledEventResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ScheduledEventResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ScheduledEventResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
