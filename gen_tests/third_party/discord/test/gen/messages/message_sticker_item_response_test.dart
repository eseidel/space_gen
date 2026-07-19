// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageStickerItemResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageStickerItemResponse(
        id: SnowflakeType('0'),
        name: 'example',
        formatType: StickerFormatTypes.png,
      );
      final parsed = MessageStickerItemResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageStickerItemResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageStickerItemResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
