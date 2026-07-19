// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MediaGalleryItemResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MediaGalleryItemResponse(
        media: UnfurledMediaResponse(
          id: SnowflakeType('0'),
          url: 'example',
          proxyUrl: 'example',
        ),
        description: 'example',
        spoiler: false,
      );
      final parsed = MediaGalleryItemResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MediaGalleryItemResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MediaGalleryItemResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
