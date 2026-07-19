// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageMentionChannelResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageMentionChannelResponse(
        id: SnowflakeType('0'),
        name: 'example',
        type: ChannelTypes.dm,
        guildId: SnowflakeType('0'),
      );
      final parsed = MessageMentionChannelResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageMentionChannelResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageMentionChannelResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
