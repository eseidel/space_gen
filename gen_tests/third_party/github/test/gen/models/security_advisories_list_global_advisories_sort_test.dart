// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAdvisoriesListGlobalAdvisoriesSort', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecurityAdvisoriesListGlobalAdvisoriesSort.updated;
      final parsed = SecurityAdvisoriesListGlobalAdvisoriesSort.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecurityAdvisoriesListGlobalAdvisoriesSort.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecurityAdvisoriesListGlobalAdvisoriesSort.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in SecurityAdvisoriesListGlobalAdvisoriesSort.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in SecurityAdvisoriesListGlobalAdvisoriesSort.values) {
        expect(
          SecurityAdvisoriesListGlobalAdvisoriesSort.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
