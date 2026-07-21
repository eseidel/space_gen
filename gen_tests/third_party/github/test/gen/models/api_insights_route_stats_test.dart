// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApiInsightsRouteStats', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApiInsightsRouteStats(<ApiInsightsRouteStatsInner>[
        ApiInsightsRouteStatsInner(),
      ]);
      final parsed = ApiInsightsRouteStats.maybeFromJson(instance.toJson())!;
      expect(parsed.toJson(), equals(instance.toJson()));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApiInsightsRouteStats.maybeFromJson(null), isNull);
    });
  });
}
