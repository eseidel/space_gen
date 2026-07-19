// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RateLimitOverview', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RateLimitOverview(
        resources: RateLimitOverviewResources(
          core: RateLimit(limit: 0, remaining: 0, reset: 0, used: 0),
          search: RateLimit(limit: 0, remaining: 0, reset: 0, used: 0),
        ),
        rate: RateLimit(limit: 0, remaining: 0, reset: 0, used: 0),
      );
      final parsed = RateLimitOverview.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RateLimitOverview.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RateLimitOverview.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
