// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('EmojiResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = EmojiResponse(
        id: SnowflakeType('0'),
        name: 'example',
        roles: <SnowflakeType>[SnowflakeType('0')],
        requireColons: false,
        managed: false,
        animated: false,
        available: false,
      );
      final parsed = EmojiResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EmojiResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EmojiResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
