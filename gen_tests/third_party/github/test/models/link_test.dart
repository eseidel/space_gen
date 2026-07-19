// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Link', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Link(href: 'example');
      final parsed = Link.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Link.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Link.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
