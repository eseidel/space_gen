// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotAlertScopeParam', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependabotAlertScopeParam.development;
      final parsed = DependabotAlertScopeParam.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependabotAlertScopeParam.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotAlertScopeParam.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in DependabotAlertScopeParam.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in DependabotAlertScopeParam.values) {
        expect(
          DependabotAlertScopeParam.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
