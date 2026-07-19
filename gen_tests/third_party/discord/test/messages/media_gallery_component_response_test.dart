// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MediaGalleryComponentResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MediaGalleryComponentResponse(
        id: 0,
        items: <MediaGalleryItemResponse>[
          MediaGalleryItemResponse(
            media: UnfurledMediaResponse(
              id: SnowflakeType('0'),
              url: 'example',
              proxyUrl: 'example',
            ),
            description: 'example',
            spoiler: false,
          ),
        ],
      );
      final parsed = MediaGalleryComponentResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MediaGalleryComponentResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MediaGalleryComponentResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
