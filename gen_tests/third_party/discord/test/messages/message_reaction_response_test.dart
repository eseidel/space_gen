// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageReactionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageReactionResponse(
        emoji: MessageReactionEmojiResponse(
          id: SnowflakeType('0'),
          name: 'example',
        ),
        count: 0,
        countDetails: const MessageReactionCountDetailsResponse(
          burst: 0,
          normal: 0,
        ),
        burstColors: const <String>['example'],
        meBurst: false,
        me: false,
      );
      final parsed = MessageReactionResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageReactionResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageReactionResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
