// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageReactionEmojiResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageReactionEmojiResponse(
        id: SnowflakeType('0'),
        name: 'example',
      );
      final parsed = MessageReactionEmojiResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageReactionEmojiResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageReactionEmojiResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
