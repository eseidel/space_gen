// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RuleSuiteResult', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RuleSuiteResult.pass;
      final parsed = RuleSuiteResult.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RuleSuiteResult.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RuleSuiteResult.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RuleSuiteResult.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RuleSuiteResult.values) {
        expect(RuleSuiteResult.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
