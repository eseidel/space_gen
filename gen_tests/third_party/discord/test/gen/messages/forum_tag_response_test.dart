// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ForumTagResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ForumTagResponse(
        id: SnowflakeType('0'),
        name: 'example',
        moderated: false,
        emojiId: SnowflakeType('0'),
        emojiName: 'example',
      );
      final parsed = ForumTagResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ForumTagResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ForumTagResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
