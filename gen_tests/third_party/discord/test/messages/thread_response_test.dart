// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ThreadResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ThreadResponse(
        id: SnowflakeType('0'),
        type: ChannelTypes.dm,
        flags: 0,
        guildId: SnowflakeType('0'),
        name: 'example',
        ownerId: SnowflakeType('0'),
        threadMetadata: ThreadMetadataResponse(
          archived: false,
          archiveTimestamp: DateTime.utc(2024),
          autoArchiveDuration: ThreadAutoArchiveDuration.oneHour,
          locked: false,
        ),
        messageCount: 0,
        memberCount: 0,
        totalMessageSent: 0,
      );
      final parsed = ThreadResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ThreadResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ThreadResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
