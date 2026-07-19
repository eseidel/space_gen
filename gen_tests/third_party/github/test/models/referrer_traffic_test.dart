// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReferrerTraffic', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReferrerTraffic(
        referrer: 'Google',
        count: 4,
        uniques: 3,
      );
      final parsed = ReferrerTraffic.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReferrerTraffic.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReferrerTraffic.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
