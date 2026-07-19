// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('KeySimple', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = KeySimple(id: 0, key: 'example');
      final parsed = KeySimple.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(KeySimple.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => KeySimple.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
