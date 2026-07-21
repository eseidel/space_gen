// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApiInsightsSubjectStats', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApiInsightsSubjectStats(
        <ApiInsightsSubjectStatsInner>[ApiInsightsSubjectStatsInner()],
      );
      final parsed = ApiInsightsSubjectStats.maybeFromJson(instance.toJson())!;
      expect(parsed.toJson(), equals(instance.toJson()));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApiInsightsSubjectStats.maybeFromJson(null), isNull);
    });
  });
}
