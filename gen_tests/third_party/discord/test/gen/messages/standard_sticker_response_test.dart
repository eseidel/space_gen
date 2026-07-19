// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('StandardStickerResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = StandardStickerResponse(
        id: SnowflakeType('0'),
        name: 'example',
        tags: 'example',
        formatType: StickerFormatTypes.png,
        description: 'example',
        packId: SnowflakeType('0'),
        sortValue: 0,
      );
      final parsed = StandardStickerResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(StandardStickerResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => StandardStickerResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
