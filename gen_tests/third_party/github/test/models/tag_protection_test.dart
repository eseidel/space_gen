// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TagProtection', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TagProtection(pattern: 'v1.*');
      final parsed = TagProtection.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TagProtection.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TagProtection.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
