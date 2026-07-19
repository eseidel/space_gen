// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('LinkWithType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = LinkWithType(href: 'example', type: 'example');
      final parsed = LinkWithType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LinkWithType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LinkWithType.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
