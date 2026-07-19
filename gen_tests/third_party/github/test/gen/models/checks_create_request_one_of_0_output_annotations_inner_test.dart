// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksCreateRequestOneOf0OutputAnnotationsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksCreateRequestOneOf0OutputAnnotationsInner(
        path: 'example',
        startLine: 0,
        endLine: 0,
        annotationLevel:
            ChecksCreateRequestOneOf0OutputAnnotationsInnerAnnotationLevel
                .notice,
        message: 'example',
      );
      final parsed =
          ChecksCreateRequestOneOf0OutputAnnotationsInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ChecksCreateRequestOneOf0OutputAnnotationsInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksCreateRequestOneOf0OutputAnnotationsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
