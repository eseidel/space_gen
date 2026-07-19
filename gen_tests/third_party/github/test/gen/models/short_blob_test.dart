// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShortBlob', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShortBlob(url: 'example', sha: 'example');
      final parsed = ShortBlob.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShortBlob.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShortBlob.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
