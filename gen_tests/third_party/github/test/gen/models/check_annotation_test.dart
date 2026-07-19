// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CheckAnnotation', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CheckAnnotation(
        path: 'README.md',
        startLine: 2,
        endLine: 2,
        startColumn: 5,
        endColumn: 10,
        annotationLevel: 'warning',
        title: 'Spell Checker',
        message: "Check your spelling for 'banaas'.",
        rawDetails: "Do you mean 'bananas' or 'banana'?",
        blobHref: 'example',
      );
      final parsed = CheckAnnotation.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CheckAnnotation.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CheckAnnotation.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
