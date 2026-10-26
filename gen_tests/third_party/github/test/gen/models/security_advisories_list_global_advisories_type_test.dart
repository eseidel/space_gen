// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAdvisoriesListGlobalAdvisoriesType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecurityAdvisoriesListGlobalAdvisoriesType.reviewed;
      final parsed = SecurityAdvisoriesListGlobalAdvisoriesType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecurityAdvisoriesListGlobalAdvisoriesType.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecurityAdvisoriesListGlobalAdvisoriesType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in SecurityAdvisoriesListGlobalAdvisoriesType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in SecurityAdvisoriesListGlobalAdvisoriesType.values) {
        expect(
          SecurityAdvisoriesListGlobalAdvisoriesType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
