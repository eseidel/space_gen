// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksUpdateRequestAnyOf1OutputAnnotationsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksUpdateRequestAnyOf1OutputAnnotationsInner(
        path: 'example',
        startLine: 0,
        endLine: 0,
        annotationLevel:
            ChecksUpdateRequestAnyOf1OutputAnnotationsInnerAnnotationLevel
                .notice,
        message: 'example',
      );
      final parsed =
          ChecksUpdateRequestAnyOf1OutputAnnotationsInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ChecksUpdateRequestAnyOf1OutputAnnotationsInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksUpdateRequestAnyOf1OutputAnnotationsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
