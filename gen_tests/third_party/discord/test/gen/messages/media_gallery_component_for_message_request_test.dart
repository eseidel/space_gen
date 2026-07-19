// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MediaGalleryComponentForMessageRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MediaGalleryComponentForMessageRequest(
        items: <MediaGalleryItemRequest>[
          MediaGalleryItemRequest(
            media: UnfurledMediaRequest(url: Uri.parse('https://example.com')),
          ),
        ],
      );
      final parsed = MediaGalleryComponentForMessageRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        MediaGalleryComponentForMessageRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MediaGalleryComponentForMessageRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
