// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('StickerPackCollectionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = StickerPackCollectionResponse(
        stickerPacks: <StickerPackResponse>[
          StickerPackResponse(
            id: SnowflakeType('0'),
            skuId: SnowflakeType('0'),
            name: 'example',
            description: 'example',
            stickers: <StandardStickerResponse>[
              StandardStickerResponse(
                id: SnowflakeType('0'),
                name: 'example',
                tags: 'example',
                formatType: StickerFormatTypes.png,
                description: 'example',
                packId: SnowflakeType('0'),
                sortValue: 0,
              ),
            ],
          ),
        ],
      );
      final parsed = StickerPackCollectionResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(StickerPackCollectionResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => StickerPackCollectionResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
