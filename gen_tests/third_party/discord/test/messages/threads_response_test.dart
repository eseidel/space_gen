// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ThreadsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ThreadsResponse(
        threads: <ThreadResponse>[
          ThreadResponse(
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
          ),
        ],
        members: <ThreadMemberResponse>[
          ThreadMemberResponse(
            id: SnowflakeType('0'),
            userId: SnowflakeType('0'),
            joinTimestamp: DateTime.utc(2024),
            flags: 0,
          ),
        ],
        hasMore: false,
      );
      final parsed = ThreadsResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ThreadsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ThreadsResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
