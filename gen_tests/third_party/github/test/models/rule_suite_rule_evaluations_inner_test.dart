// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RuleSuiteRuleEvaluationsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RuleSuiteRuleEvaluationsInner();
      final parsed = RuleSuiteRuleEvaluationsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RuleSuiteRuleEvaluationsInner.maybeFromJson(null), isNull);
    });
  });
}
