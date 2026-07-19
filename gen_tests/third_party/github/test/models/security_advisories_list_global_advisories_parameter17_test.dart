// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAdvisoriesListGlobalAdvisoriesParameter17', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          SecurityAdvisoriesListGlobalAdvisoriesParameter17.updated;
      final parsed =
          SecurityAdvisoriesListGlobalAdvisoriesParameter17.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecurityAdvisoriesListGlobalAdvisoriesParameter17.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecurityAdvisoriesListGlobalAdvisoriesParameter17.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in SecurityAdvisoriesListGlobalAdvisoriesParameter17.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in SecurityAdvisoriesListGlobalAdvisoriesParameter17.values) {
        expect(
          SecurityAdvisoriesListGlobalAdvisoriesParameter17.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
