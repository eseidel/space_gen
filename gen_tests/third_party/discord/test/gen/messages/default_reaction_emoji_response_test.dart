// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('DefaultReactionEmojiResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DefaultReactionEmojiResponse(
        emojiId: SnowflakeType('0'),
        emojiName: 'example',
      );
      final parsed = DefaultReactionEmojiResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DefaultReactionEmojiResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DefaultReactionEmojiResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
