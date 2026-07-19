// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ListGuildSoundboardSoundsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ListGuildSoundboardSoundsResponse(
        items: <SoundboardSoundResponse>[
          SoundboardSoundResponse(
            name: 'example',
            soundId: SnowflakeType('0'),
            volume: 0,
            emojiId: SnowflakeType('0'),
            emojiName: 'example',
            available: false,
          ),
        ],
      );
      final parsed = ListGuildSoundboardSoundsResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ListGuildSoundboardSoundsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ListGuildSoundboardSoundsResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
