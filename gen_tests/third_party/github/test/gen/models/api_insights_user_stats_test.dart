// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApiInsightsUserStats', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApiInsightsUserStats(<ApiInsightsUserStatsInner>[
        ApiInsightsUserStatsInner(),
      ]);
      final parsed = ApiInsightsUserStats.maybeFromJson(instance.toJson())!;
      expect(parsed.toJson(), equals(instance.toJson()));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApiInsightsUserStats.maybeFromJson(null), isNull);
    });
  });
}
