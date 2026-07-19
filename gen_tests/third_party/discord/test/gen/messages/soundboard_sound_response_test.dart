// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SoundboardSoundResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SoundboardSoundResponse(
        name: 'example',
        soundId: SnowflakeType('0'),
        volume: 0,
        emojiId: SnowflakeType('0'),
        emojiName: 'example',
        available: false,
      );
      final parsed = SoundboardSoundResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SoundboardSoundResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SoundboardSoundResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
