// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PagesSourceHash', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PagesSourceHash(branch: 'example', path: 'example');
      final parsed = PagesSourceHash.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PagesSourceHash.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PagesSourceHash.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
