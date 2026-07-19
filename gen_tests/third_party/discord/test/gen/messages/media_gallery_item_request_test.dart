// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MediaGalleryItemRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MediaGalleryItemRequest(
        media: UnfurledMediaRequest(url: Uri.parse('https://example.com')),
      );
      final parsed = MediaGalleryItemRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MediaGalleryItemRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MediaGalleryItemRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
