// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ValidationErrorErrorsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ValidationErrorErrorsInner(code: 'example');
      final parsed = ValidationErrorErrorsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ValidationErrorErrorsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ValidationErrorErrorsInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
