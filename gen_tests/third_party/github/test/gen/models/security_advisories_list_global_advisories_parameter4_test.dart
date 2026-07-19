// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAdvisoriesListGlobalAdvisoriesParameter4', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecurityAdvisoriesListGlobalAdvisoriesParameter4.unknown;
      final parsed =
          SecurityAdvisoriesListGlobalAdvisoriesParameter4.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecurityAdvisoriesListGlobalAdvisoriesParameter4.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecurityAdvisoriesListGlobalAdvisoriesParameter4.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in SecurityAdvisoriesListGlobalAdvisoriesParameter4.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in SecurityAdvisoriesListGlobalAdvisoriesParameter4.values) {
        expect(
          SecurityAdvisoriesListGlobalAdvisoriesParameter4.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
