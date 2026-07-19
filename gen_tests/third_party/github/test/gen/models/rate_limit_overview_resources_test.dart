// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RateLimitOverviewResources', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RateLimitOverviewResources(
        core: RateLimit(limit: 0, remaining: 0, reset: 0, used: 0),
        search: RateLimit(limit: 0, remaining: 0, reset: 0, used: 0),
      );
      final parsed = RateLimitOverviewResources.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RateLimitOverviewResources.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RateLimitOverviewResources.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
