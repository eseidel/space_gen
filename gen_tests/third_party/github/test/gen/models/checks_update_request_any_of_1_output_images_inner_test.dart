// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksUpdateRequestAnyOf1OutputImagesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksUpdateRequestAnyOf1OutputImagesInner(
        alt: 'example',
        imageUrl: 'example',
      );
      final parsed = ChecksUpdateRequestAnyOf1OutputImagesInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ChecksUpdateRequestAnyOf1OutputImagesInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksUpdateRequestAnyOf1OutputImagesInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
