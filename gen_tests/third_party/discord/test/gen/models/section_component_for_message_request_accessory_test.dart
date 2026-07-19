// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SectionComponentForMessageRequestAccessory', () {
    test(
      'ThumbnailComponentForMessageRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = ThumbnailComponentForMessageRequest(
          media: UnfurledMediaRequest(url: Uri.parse('https://example.com')),
        );
        final parsed = ThumbnailComponentForMessageRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(
        SectionComponentForMessageRequestAccessory.maybeFromJson(null),
        isNull,
      );
    });
  });
}
