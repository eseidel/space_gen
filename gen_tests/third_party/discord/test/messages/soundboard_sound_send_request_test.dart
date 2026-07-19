// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SoundboardSoundSendRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SoundboardSoundSendRequest(soundId: SnowflakeType('0'));
      final parsed = SoundboardSoundSendRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SoundboardSoundSendRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SoundboardSoundSendRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
