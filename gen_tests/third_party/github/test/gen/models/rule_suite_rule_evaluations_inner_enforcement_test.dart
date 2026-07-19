// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RuleSuiteRuleEvaluationsInnerEnforcement', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RuleSuiteRuleEvaluationsInnerEnforcement.active;
      final parsed = RuleSuiteRuleEvaluationsInnerEnforcement.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RuleSuiteRuleEvaluationsInnerEnforcement.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RuleSuiteRuleEvaluationsInnerEnforcement.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RuleSuiteRuleEvaluationsInnerEnforcement.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RuleSuiteRuleEvaluationsInnerEnforcement.values) {
        expect(
          RuleSuiteRuleEvaluationsInnerEnforcement.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
