// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksUpdateRequestAnyOf0OutputAnnotationsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksUpdateRequestAnyOf0OutputAnnotationsInner(
        path: 'example',
        startLine: 0,
        endLine: 0,
        annotationLevel:
            ChecksUpdateRequestAnyOf0OutputAnnotationsInnerAnnotationLevel
                .notice,
        message: 'example',
      );
      final parsed =
          ChecksUpdateRequestAnyOf0OutputAnnotationsInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ChecksUpdateRequestAnyOf0OutputAnnotationsInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksUpdateRequestAnyOf0OutputAnnotationsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
