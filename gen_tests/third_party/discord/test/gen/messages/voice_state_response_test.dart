// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('VoiceStateResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = VoiceStateResponse(
        channelId: SnowflakeType('0'),
        deaf: false,
        guildId: SnowflakeType('0'),
        mute: false,
        requestToSpeakTimestamp: DateTime.utc(2024),
        suppress: false,
        selfStream: false,
        selfDeaf: false,
        selfMute: false,
        selfVideo: false,
        sessionId: 'example',
        userId: SnowflakeType('0'),
      );
      final parsed = VoiceStateResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(VoiceStateResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => VoiceStateResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
