// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChannelFollowerResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ChannelFollowerResponse(
        channelId: SnowflakeType('0'),
        webhookId: SnowflakeType('0'),
      );
      final parsed = ChannelFollowerResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChannelFollowerResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChannelFollowerResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
