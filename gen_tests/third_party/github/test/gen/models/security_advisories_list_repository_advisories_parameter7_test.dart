// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAdvisoriesListRepositoryAdvisoriesParameter7', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          SecurityAdvisoriesListRepositoryAdvisoriesParameter7.triage;
      final parsed =
          SecurityAdvisoriesListRepositoryAdvisoriesParameter7.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecurityAdvisoriesListRepositoryAdvisoriesParameter7.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            SecurityAdvisoriesListRepositoryAdvisoriesParameter7.maybeFromJson(
              '__invalid_enum_value__',
            ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in SecurityAdvisoriesListRepositoryAdvisoriesParameter7.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in SecurityAdvisoriesListRepositoryAdvisoriesParameter7.values) {
        expect(
          SecurityAdvisoriesListRepositoryAdvisoriesParameter7.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
