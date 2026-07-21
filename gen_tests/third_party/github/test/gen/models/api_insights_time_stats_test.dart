// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApiInsightsTimeStats', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApiInsightsTimeStats(<ApiInsightsTimeStatsInner>[
        ApiInsightsTimeStatsInner(),
      ]);
      final parsed = ApiInsightsTimeStats.maybeFromJson(instance.toJson())!;
      expect(parsed.toJson(), equals(instance.toJson()));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApiInsightsTimeStats.maybeFromJson(null), isNull);
    });
  });
}
