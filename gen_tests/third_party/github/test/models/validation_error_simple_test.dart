// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ValidationErrorSimple', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ValidationErrorSimple(
        message: 'example',
        documentationUrl: 'example',
      );
      final parsed = ValidationErrorSimple.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ValidationErrorSimple.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ValidationErrorSimple.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
