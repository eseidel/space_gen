// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('ErrorError', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ErrorError(name: 'example', message: 'example');
      final parsed = ErrorError.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ErrorError.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ErrorError.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
