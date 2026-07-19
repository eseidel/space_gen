// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SectionComponentResponseAccessory', () {
    test('ThumbnailComponentResponse round-trips via maybeFromJson/toJson', () {
      final instance = ThumbnailComponentResponse(
        id: 0,
        media: UnfurledMediaResponse(
          id: SnowflakeType('0'),
          url: 'example',
          proxyUrl: 'example',
        ),
        description: 'example',
        spoiler: false,
      );
      final parsed = ThumbnailComponentResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SectionComponentResponseAccessory.maybeFromJson(null), isNull);
    });
  });
}
