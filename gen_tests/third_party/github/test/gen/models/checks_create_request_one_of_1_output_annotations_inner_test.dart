// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksCreateRequestOneOf1OutputAnnotationsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksCreateRequestOneOf1OutputAnnotationsInner(
        path: 'example',
        startLine: 0,
        endLine: 0,
        annotationLevel:
            ChecksCreateRequestOneOf1OutputAnnotationsInnerAnnotationLevel
                .notice,
        message: 'example',
      );
      final parsed =
          ChecksCreateRequestOneOf1OutputAnnotationsInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ChecksCreateRequestOneOf1OutputAnnotationsInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksCreateRequestOneOf1OutputAnnotationsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
