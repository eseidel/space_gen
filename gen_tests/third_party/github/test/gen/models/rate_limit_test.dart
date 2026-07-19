// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RateLimit', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RateLimit(limit: 0, remaining: 0, reset: 0, used: 0);
      final parsed = RateLimit.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RateLimit.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RateLimit.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
