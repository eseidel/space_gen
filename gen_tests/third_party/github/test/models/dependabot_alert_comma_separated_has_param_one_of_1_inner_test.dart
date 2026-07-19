// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotAlertCommaSeparatedHasParamOneOf1Inner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependabotAlertCommaSeparatedHasParamOneOf1Inner.patch;
      final parsed =
          DependabotAlertCommaSeparatedHasParamOneOf1Inner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependabotAlertCommaSeparatedHasParamOneOf1Inner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotAlertCommaSeparatedHasParamOneOf1Inner.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in DependabotAlertCommaSeparatedHasParamOneOf1Inner.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in DependabotAlertCommaSeparatedHasParamOneOf1Inner.values) {
        expect(
          DependabotAlertCommaSeparatedHasParamOneOf1Inner.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
