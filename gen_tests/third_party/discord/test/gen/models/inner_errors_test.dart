// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('InnerErrors', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = InnerErrors(
        errors: <Error>[Error(code: 0, message: 'example')],
      );
      final parsed = InnerErrors.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InnerErrors.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InnerErrors.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
