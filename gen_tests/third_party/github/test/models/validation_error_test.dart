// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ValidationError', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ValidationError(
        message: 'example',
        documentationUrl: 'example',
      );
      final parsed = ValidationError.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ValidationError.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ValidationError.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
