// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RuleSuites', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RuleSuites(<RuleSuitesInner>[RuleSuitesInner()]);
      final parsed = RuleSuites.maybeFromJson(instance.toJson())!;
      expect(parsed.toJson(), equals(instance.toJson()));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RuleSuites.maybeFromJson(null), isNull);
    });
  });
}
