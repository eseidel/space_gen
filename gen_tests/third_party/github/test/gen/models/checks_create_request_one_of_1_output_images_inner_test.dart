// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksCreateRequestOneOf1OutputImagesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksCreateRequestOneOf1OutputImagesInner(
        alt: 'example',
        imageUrl: 'example',
      );
      final parsed = ChecksCreateRequestOneOf1OutputImagesInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ChecksCreateRequestOneOf1OutputImagesInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksCreateRequestOneOf1OutputImagesInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
